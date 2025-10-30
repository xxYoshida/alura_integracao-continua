FROM golang:1.22-alpine

WORKDIR /app

# Copia go.mod e go.sum primeiro (cache de dependências)
COPY go.mod go.sum ./
RUN go mod download

# Copia o resto do código
COPY . .

# Compila a app
RUN go build -o main .

# Executa
CMD ["./main"]
