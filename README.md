# python_webserver_docker_example
This is an example project how to set up a [dockerized] Python webserver using [Flask], [uWSGI] and [Supervisor]

Usage:
```sh
$ docker build -t webapp .
$ docker run -it -P webapp

```


 [dockerized]: <https://www.docker.com/>
 [Flask]: <http://flask.pocoo.org/>
 [uWSGI]: <https://uwsgi-docs.readthedocs.io/en/latest/>
 [Supervisor]: <http://supervisord.org/>
