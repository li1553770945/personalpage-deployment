# 个人主页后端部署

本仓库包含个人站点、SheepIM 与相关基础设施的 Kubernetes / nginx 部署清单。部署命令与运维说明见各目录下的 README。

## 集群

| 项目 | 说明 | 文档 |
|------|------|------|
| K8s 集群 | 单节点 master 初始化、网络插件与排障 | [infra/k8s](infra/k8s/README.md) |

## 基础设施

| 项目 | 说明 | 文档 |
|------|------|------|
| etcd | 服务发现与配置存储（3 副本 StatefulSet） | [infra/etcd](infra/etcd/README.md) |
| Kafka | SheepIM 消息推送队列（KRaft 单节点） | [infra/kafka](infra/kafka/README.md) |
| Redis | 缓存与会话（room / online 等复用） | [infra/redis](infra/redis/README.md) |
| Jaeger | 分布式链路追踪（all-in-one） | [infra/observer/jaeger](infra/observer/jaeger/README.md) |
| OpenTelemetry Collector | 采集 trace/metrics 并转发 | [infra/observer/otel](infra/observer/otel/README.md) |
| Prometheus | 指标采集与查询 | [infra/observer/prometheus](infra/observer/prometheus/README.md) |
| Uptime Kuma | 服务可用性监控面板 | [infra/observer/kuma](infra/observer/kuma/README.md) |
| Infisical | 密钥管理平台（Helm 部署） | [infra/infisical](infra/infisical/README.md) |

## 个人站后端

| 项目 | 说明 | 文档 |
|------|------|------|
| personal-page-be | 个人网站单体后端，包含项目、文件、反馈、通知、AI 对话、个人站登录注册 | [personal-page/personal-page-be](personal-page/personal-page-be/README.md) |

旧的 `personal-project-service`、`personal-file-service`、`personal-feedback-service`、`personal-notify-service`、`personal-aichat-service` K8s 清单已移除；新流量应走 `personal-page-be`。

## SheepIM

| 项目 | 说明 | 文档 |
|------|------|------|
| sheepim-api-gateway | IM API 统一网关 | [personal-page/sheepim/sheepim-api-gateway](personal-page/sheepim/sheepim-api-gateway/README.md) |
| sheepim-user-service | 用户资料 | [personal-page/sheepim/sheepim-user-service](personal-page/sheepim/sheepim-user-service/README.md) |
| sheepim-auth-service | 认证与 JWT | [personal-page/sheepim/sheepim-auth-service](personal-page/sheepim/sheepim-auth-service/README.md) |
| sheepim-room-service | 聊天室 | [personal-page/sheepim/sheepim-room-service](personal-page/sheepim/sheepim-room-service/README.md) |
| sheepim-online-service | 在线状态 | [personal-page/sheepim/sheepim-online-service](personal-page/sheepim/sheepim-online-service/README.md) |
| sheepim-connect-service | WebSocket 长连接 | [personal-page/sheepim/sheepim-connect-service](personal-page/sheepim/sheepim-connect-service/README.md) |
| sheepim-push-proxy-service | 写入 Kafka 消息队列 | [personal-page/sheepim/sheepim-push-proxy-service](personal-page/sheepim/sheepim-push-proxy-service/README.md) |
| sheepim-push-worker-service | 消费 Kafka 并推送到在线用户 | [personal-page/sheepim/sheepim-push-worker-service](personal-page/sheepim/sheepim-push-worker-service/README.md) |

## 其他

| 项目 | 说明 | 文档 |
|------|------|------|
| nginx | 反向代理与域名路由（宿主机） | [nginx](nginx/README.md) |
| Cloudreve | 私有网盘（K8s，含 PostgreSQL / Redis） | [other-tools/cloudreve/k8s](other-tools/cloudreve/k8s/README.md) |
| Open WebUI | 本地 LLM Web 界面 | [other-tools/openwebui](other-tools/openwebui/README.md) |
