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
