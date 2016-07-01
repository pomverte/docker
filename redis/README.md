## Redis
Redis server with a password set in the configuration file.

Note : docker-compose seems to be bugged if you want to mount volumes for files, it will create a directory instead
```
    volumes:
      - ./build/redis.conf:/usr/local/etc/redis/redis.conf
	command: redis-server /usr/local/etc/redis/redis.conf
```
So I had to rebuild a new image with a Dockerfile

```
docker run -it -d -p 6379:6379 -v /path/to/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis:3.0.7 redis-server /usr/local/etc/redis/redis.conf
```
