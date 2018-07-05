# Envoy Proxy Prototype

This is an example to illustrate the use of Envoy as a service sidecar proxy in a service orientated architecture.

Envoy is also used at the edge, as a layer 7 proxy, to route HTTP requests to the backend HTTP services via there respective Envoy proxy.

Each backend service connects onto dependent services, such as Postgres, Redis and RabbitMQ, via Envoy as a TCP proxy.

This provides a number of benefits, the greatest being for operational visibility, since all network traffic is proxied by Envoy, and Envoy is fully instrumented, it's possible to collect and collate all the metrics into a single dashboard.

## TODO

* [x] gateway
  + [x] http routing
  + [x] admin interface
* [x] service which consumes postgres
  + [x] postgres tcp routing
  + [x] admin interface
* [x] service which consumes redis
  + [x] redis tcp routing
  + [x] admin interface
* [x] service which consumes rabbitmq
  + [x] publisher
  + [x] subscriber (worker)
  + [x] rabbitmq tcp routing
  + [x] admin interface
* [x] metrics collection via prometheus
* [ ] zipkin
* [x] grafana
  + [x] envoy dashboard
  + [ ] service dashboard
  + [x] prometheus dashboard
  + [x] grafana dashboard
* [ ] service discovery
* [ ] vagrant setup
* [ ] architecture diagrams
* [ ] improve readme

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

## Overview
### Architecture
### Flows
### What's Not Implemented
## Prerequisites
### Linux Install
### Windows Install
## Getting Started
### Development Environment
## Code Tour
### Consuming the API
## Notes

## Further Reading

* [Microsoft Architecture: Sidecar Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/sidecar)
* [Dave's Two Cents: Sidecar Pattern](https://blog.davemdavis.net/2018/03/13/the-sidecar-pattern/)
* [Spring Cloud Series: Microservices Sidecar Pattern](http://tech.asimio.net/2018/02/20/Microservices-Sidecar-pattern-implementation-using-Postgres-Spring-Cloud-Netflix-and-Docker.html)
* [Microservices Patterns With Envoy Sidecar Proxy: The series](http://blog.christianposta.com/microservices/00-microservices-patterns-with-envoy-proxy-series/)
* [Microservices.io: Sidecar Pattern](http://microservices.io/patterns/deployment/sidecar.html)
* [Envoy Documentation](https://www.envoyproxy.io/docs/envoy/v1.5.0/)
* [Grafana Documentation: Provisioning](http://docs.grafana.org/installation/configuration/#provisioning)
* [Preconfigured Dashboards in Grafana 5](https://ops.tips/blog/initialize-grafana-with-preconfigured-dashboards/#example)
* [Grafana Documentation: Installation](http://docs.grafana.org/installation/docker/)
* [Guide to authoring Docker images](http://www.projectatomic.io/docs/docker-image-author-guidance/)
* [Container best practices](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b)
* [The Easiest Way to Roll Out Envoy](https://blog.turbinelabs.io/the-easiest-way-to-roll-out-envoy-390961a0ddd4)
* [Incremental Blue/Green Deploys](https://www.learnenvoy.io/articles/incremental-deploys.html)
* [Envoy Stats](https://blog.envoyproxy.io/envoy-stats-b65c7f363342)
* [Envoy Dashboards](https://blog.envoyproxy.io/lyfts-envoy-dashboards-5c91738816b1)
* [A Basic Service Mesh with Envoy](https://blog.turbinelabs.io/a-basic-service-mesh-with-envoy-71d16bb7347d)
* [Connect your Service Discovery to Envoy](https://blog.turbinelabs.io/connect-your-service-discovery-to-envoy-6fbcd1dd0d2a)
* [Envoy Documentation: HTTP Router Configuration](https://www.envoyproxy.io/docs/envoy/latest/api-v2/config/filter/http/router/v2/router.proto#envoy-api-msg-config-filter-http-router-v2-router)
* [Envoy Source Code](https://github.com/envoyproxy/envoy)

_TO BE COMPLETED_

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
