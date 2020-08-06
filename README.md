# kairosdb-docker-image


### Build image
```bash
docker build -t userexample/kairosdb:0.x .
```
Example:
```bash
docker build -t lil-rose/kairosdb:0.1 .
```


### Run a docker container:

```bash
docker run -d --name kairos-1 --network cassandra-net -p 8080:8080 -e "CASSANDRA_HOST_LIST=cassandra-1:9160" lil-rose/kairosdb:0.1
```

First make sure to run a Cassandra docker container with the official Docker image of Cassandra from Dockerhub. Also, create cassandra-net network and run your cassandra container inside this networl.