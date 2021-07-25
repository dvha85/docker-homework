FROM golang:alpine as builder

WORKDIR /build

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build the Go build
RUN go build -o main .

# -------------------------------

# Start a new stage from scratch
FROM alpine:latest

WORKDIR /root/

# Copy the Pre-built binary file from the previous stage. Observe we also copied the .env file
COPY --from=builder /build/main .
COPY config/app/.env .
COPY config/app/app.conf .

EXPOSE 8080
CMD ["./main"]