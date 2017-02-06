[agendor/mysql](https://hub.docker.com/r/agendor/mysql)
==================

Base docker image to run a MySQL database server in [`azk`](http://azk.io)

MySQL versions (tags)
---

<versions>
- [`latest`, `5.5`](https://github.com/agendor/docker-mysql/blob/master/Dockerfile)
</versions>

Image content use https://github.com/docker-library/mysql

### Auto download and add this to be loaded by `/entrypoint.sh`

- Set env `MYSQL_DUMP_URL` url

```sh
docker run -e MYSQL_DUMP_URL=<URL> agendor/mysql
```

To clean database (when used with volumes), run:

```sh
docker run agendor/mysql -- bash -c "rm -rf /var/lib/mysql/*"
```

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[issues]: https://github.com/agendor/docker-mysql/issues

[imagelayers]: https://imagelayers.io/?images=agendor/mysql:latest,agendor/mysql:5.5
[imagelayers-badge]: https://imagelayers.io/badge/agendor/mysql:latest.svg

[license]: ./LICENSE
