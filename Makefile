export GOPATH := ${CURDIR}
PKG := github.com/shadowsocks/go-shadowsocks2
CMD := shadowsocks

.PHONY: all
all: cmd

.PHONY: init
init:
	go get -d ${PKG}

.PHONY: update
update:
	go get -u all

.PHONY: clean
clean:
	rm -rf bin pkg

cmd:
	go build -o bin/${CMD} ${PKG}

linux-amd64:
	env GOOS=linux GOARCH=amd64 go build -o bin/${CMD}-linux-amd64 ${PKG}

linux-arm:
	env GOOS=linux GOARCH=arm GOARM=7 go build -o bin/${CMD}-linux-arm ${PKG}

darwin-amd64:
	env GOOS=darwin GOARCH=amd64 go build -o bin/${CMD}-darwin-amd64 ${PKG}

windows-amd64:
	env GOOS=windows GOARCH=amd64 go build -o bin/${CMD}-amd64.exe ${PKG}
