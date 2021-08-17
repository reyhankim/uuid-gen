FROM golang:1.16.2-alpine
EXPOSE 8080
RUN apk add --update git; \
    mkdir -p ${GOPATH}/uuid-gen; \
    go mod vendor
WORKDIR ${GOPATH}/uuid-gen/
COPY cmd ${GOPATH}/uuid-gen/cmd
RUN go build -o uuid-gen/cmd .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=0 /go/uuid-gen/uuid-gen .
CMD [ "/app/uuid-gen" ]