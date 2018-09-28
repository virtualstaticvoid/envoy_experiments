## Documentation Points

* sidecar pattern
* doubles as a layer 7 proxy
* http path routing
* http rewrites
* tcp proxy
* stats / metrics / pull based
* retry configurations
* load balancing
* service discovery

## Usage

* redis-cli -p 8010
* psql -h localhost -p 8022 -U envoy -d exampledb
* docker-compose exec rabbitmq rabbitmqctl status

```
curl localhost:8000/
curl localhost:8000/foo
curl localhost:8000/foo/bar
curl localhost:8000/foo/bar/baz
curl localhost:8000/postgres
curl -d "" localhost:8000/rabbitmq/publish
curl localhost:8000/redis
```

```
curl localhost:8001/stats/prometheus -o gateway.txt
curl localhost:8051/stats/prometheus -o http_service.txt
curl localhost:8061/stats/prometheus -o redis_service.txt
curl localhost:8071/stats/prometheus -o postgres_service.txt
curl localhost:8081/stats/prometheus -o rabbitmq_service.txt
curl localhost:8091/stats/prometheus -o rabbitmq_worker.txt
```

```
http://localhost:8000/
http://localhost:8000/foo
http://localhost:8001/stats
http://localhost:8011/stats
http://localhost:8021/stats
http://localhost:8031/stats
http://localhost:8033/#/queues
http://localhost:8050/
http://localhost:8051/stats
http://localhost:8060/
http://localhost:8061/stats
http://localhost:8070/
http://localhost:8071/stats
```

```
#!/bin/bash

# curl localhost:8000/foo/bar/baz
wrk -t12 -c200 -d30s http://localhost:8000/foo/bar/baz

# curl localhost:8000/foo/bar
wrk -t12 -c200 -d30s http://localhost:8000/foo/bar

# curl localhost:8000/foo
wrk -t12 -c200 -d30s http://localhost:8000/foo

# curl -d "foo=bar" localhost:8000/rabbitmq/publish
wrk -t12 -c200 -d30s -s files/post.lua http://localhost:8080/publish

# curl localhost:8000/postgres
wrk -t12 -c200 -d30s http://localhost:8000/postgres

# curl localhost:8000/redis
wrk -t12 -c200 -d30s http://localhost:8000/redis
```
