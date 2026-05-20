#!/bin/bash
echo "开始高频并发冲击测试..."
for i in {1..100}
do
  # 同时 apply 两个配置
  kubectl apply -f sheepim-user-service/config-secret.yml &
  kubectl apply -f sheepim-auth-service/configmap.yml &
  wait
  
  # 强制重启 user 服务
  kubectl rollout restart deployment sheepim-user-service-deployment > /dev/null
  
  # 等待新 Pod 启动并检查
  sleep 5
  CONTENT=$(kubectl logs -l app=sheepim-user-service-pod --tail=50 | grep "service-name" | head -n 1)
  
  echo "第 $i 次尝试: $CONTENT"
  
  if [[ $CONTENT == *"auth"* ]]; then
    echo "！！！检测到配置漂移：User 服务读到了 Auth 的配置！！！"
    exit 1
  fi
done
echo "未检测到异常，可能是特定负载下的偶然事件。"