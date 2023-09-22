# upstream-app/Dockerfile
FROM golang:1.16 AS builder

WORKDIR /app
COPY . .
#RUN go.mod download
RUN go build -o upstream-app

FROM debian:bullseye-slim

WORKDIR /root
#COPY --from=builder /app/upstream-app /usr/local/bin/
COPY --from=builder /app/upstream-app .

EXPOSE 8080

CMD ["./upstream-app"]
