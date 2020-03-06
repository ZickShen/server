echo : cborplugin/echo/main.go
	cd cborplugin/echo && go build . && mv echo ../../bin/

server : cmd/server/main.go
	cd cmd/server && go build . && mv server ../../bin/