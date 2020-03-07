echo : cborplugin/echo/main.go
	cd cborplugin/echo && CGO_ENABLED=0 GOOS=linux go build -ldflags '-w -extldflags "-static"' . && mv echo ../../bin/

server : cmd/server/main.go
	cd cmd/server && CGO_ENABLED=0 GOOS=linux go build -ldflags '-w -extldflags "-static"' . && mv server ../../bin/

docker : echo server bin/memspool bin/panda_server
	docker build --network=host -t katzenpost/server .