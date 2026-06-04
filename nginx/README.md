# nginx

宿主机反向代理：将 `*.peacesheep.xyz` 等域名转发到集群 NodePort 或上游服务。配置文件在 `nginx/conf.d/`。

## 部署 / 重载

```bash
sudo cp nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp nginx/conf.d/*.conf /etc/nginx/conf.d/
sudo nginx -t
sudo nginx -s reload
```

## 说明

- 各 `conf.d/*.conf` 文件顶部通常有域名与后端端口注释。
- 修改后务必先 `nginx -t` 再 reload。
