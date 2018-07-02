# Envoy Proxy Prototype

_TO BE COMPLETED_

## Usage

##

* redis-cli -p 8010
* psql -h localhost -p 8022 -U envoy -d exampledb
* docker-compose exec rabbitmq rabbitmqctl status

## TODO

* Service which consumes postgres
* Service which consumes redis
* Service which consumes rabbitmq
* Metrics collection from sidecars via prometheus
* Zipkin
* Grafana dashboard

## Links

* [Documentation](https://www.envoyproxy.io/docs/envoy/v1.5.0/)

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
curl localhost:8051/stats/prometheus -o http_service.txt
curl localhost:8061/stats/prometheus -o redis_service.txt
curl localhost:8071/stats/prometheus -o postgres_service.txt
curl localhost:8081/stats/prometheus -o rabbitmq_service.txt
curl localhost:8091/stats/prometheus -o rabbitmq_worker.txt
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


http://docs.grafana.org/installation/configuration/#provisioning
https://ops.tips/blog/initialize-grafana-with-preconfigured-dashboards/#example
http://docs.grafana.org/installation/docker/
http://www.projectatomic.io/docs/docker-image-author-guidance/
https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b
https://blog.turbinelabs.io/the-easiest-way-to-roll-out-envoy-390961a0ddd4


https://www.learnenvoy.io/articles/incremental-deploys.html
https://blog.envoyproxy.io/envoy-stats-b65c7f363342
https://blog.envoyproxy.io/lyfts-envoy-dashboards-5c91738816b1
https://blog.turbinelabs.io/a-basic-service-mesh-with-envoy-71d16bb7347d
https://blog.turbinelabs.io/connect-your-service-discovery-to-envoy-6fbcd1dd0d2a
https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/filter/http/router/v2/router.proto#envoy-api-msg-config-filter-http-router-v2-router
https://github.com/envoyproxy/envoy
