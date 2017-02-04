# Ruby on Rails budgeting application

## License

## Getting started

To get started with the app, clone the repo and then startup docker:

```
$ docker-compose build
$ docker-compose run --rm web rails db:create
$ docker-compose run --rm web rails db:setup
$ docker-compose up
```

Run the test suite to verify that everything is working:

```
$ docker-compose run --rm web rails test
```

Run guard to get rubocop and test run automatically

```
$ docker-compose run --rm web bundle exec guard
```
