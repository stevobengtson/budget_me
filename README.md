# Ruby on Rails budgeting application

## License

## Getting started

To get started with the app, clone the repo and then startup docker:

```
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose run web rails db:setup
$ docker-compose up
```

Run the test suite to verify that everything is working:

```
$ docker-compose run web rails test
```
