# downstream-app/Dockerfile
FROM golang:1.16 AS builder

#WORKDIR /go/src/app
WORKDIR  /app
# Copy the source code from the right location (relative to the Dockerfile)
# This should copy the contents of the current directory to /go/src/app
COPY ./ .  

RUN go build -o downstream-app

FROM debian:bullseye-slim

WORKDIR /root

#COPY --from=builder /go/src/app/downstream-app /usr/local/bin/
COPY --from=builder /app/downstream-app .

EXPOSE 8080

CMD ["./downstream-app"]
