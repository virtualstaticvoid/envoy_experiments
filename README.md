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
* [x] vagrant setup
* [ ] architecture diagrams
* [ ] complete readme

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

## License

MIT License. Copyright (c) 2018 Chris Stefano. See LICENSE for details.
