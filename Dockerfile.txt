FROM golang:1.21-alpine

# Install Git
RUN apk add --no-cache git

# Set working directory
WORKDIR /app

# Clone the latest PocketBase release
RUN git clone https://github.com/pocketbase/pocketbase.git . \
  && go mod tidy

# Build
RUN go build -o pocketbase

# Start script
COPY start.sh .

EXPOSE 8090

CMD ["./start.sh"]
