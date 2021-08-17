FROM golang:1.11.1-alpine
EXPOSE 8080
RUN apk add --update git; \
    mkdir -p ${GOPATH}/uuid-gen; \
    go get -u github.com/gorilla/mux; \
    go get -u github.com/google/uuid
WORKDIR ${GOPATH}/uuid-gen/
COPY main.go ${GOPATH}/uuid-gen/
RUN go build -o uuid-gen .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=0 /go/uuid-gen/uuid-gen .
CMD [ "/app/uuid-gen" ]