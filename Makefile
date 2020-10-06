.PHONY: server
build:
	GOGC=off GOOS=linux go build -ldflags="-s -w" -o ./bin/server
deploy:
	rsync -azP --delete ./bin/* root@${SERVER_IP}:/root/geolocation/bin
install:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service install --config "/root/geolocation/bin/config.json"
start:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service start
stop:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service stop
status:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service status
remove:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service remove
restart:
	ssh root@${SERVER_IP} /root/geolocation/bin/server --service restart
openPort:
	ssh root@${SERVER_IP} ufw allow 30001/tcp
log:
	ssh root@${SERVER_IP} tail -f /root/geolocation/bin/server.log
