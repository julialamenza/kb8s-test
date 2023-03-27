FROM golang:alpine

WORKDIR /go/

COPY file.p12 .
COPY main.go .

EXPOSE 80

CMD [ "go", "run", "main.go" ]


