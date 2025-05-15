FROM alpine:latest

# 安裝必要套件
RUN apk add --no-cache ca-certificates

# 設定工作目錄
WORKDIR /app

# 複製 PocketBase 可執行檔到容器中
COPY pocketbase /app/pocketbase

# 開放預設埠口
EXPOSE 8090

# 啟動 PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]