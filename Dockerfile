FROM alpine:latest

WORKDIR /app
COPY . .
RUN wget -O ./gopine https://github.com/nothing2512/gopine/releases/latest/download/gopine-linux-amd64

CMD ["./gopine", "start", "main", "."]