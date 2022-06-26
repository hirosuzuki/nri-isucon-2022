HOST0=isucon@18.181.165.237
HOST1=isucon@18.182.5.27
HOST2=isucon@52.195.12.241

# HOST0 10.0.3.74
# HOST1 10.0.5.163
# HOST2 10.0.5.218

TIMEID := $(shell date +%Y%m%d-%H%M%S)

# https://github.com/hirosuzuki/perf-logs-viewer
# https://github.com/hirosuzuki/go-sql-logger

build:
	go build -o isubnb 

deploy: build

host0:
	ssh ${HOST0}

host1:
	ssh ${HOST1}

host2:
	ssh ${HOST2}

fetch:
	mkdir -p files/
	scp ${HOST1}:/etc/nginx/nginx.conf files/
	scp ${HOST1}:/etc/mysql/my.cnf files/
	scp ${HOST1}:/etc/systemd/system/isubnb.go.service files/
	scp ${HOST1}:isubnb/webapp/backend/go/*.go files/
	scp ${HOST1}:isubnb/webapp/backend/go/go.* files/
	scp ${HOST1}:env.sh files/

