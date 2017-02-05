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


Needed:
* Accounts - The accounts used for budgeting (can be excluded from budget just for tracking)
  * Transaction - This is a single transaction record in an account (link to other transactions for transfers)
  * RecurringTransaction - RecurringTransactions, these will become a Transaction
* Payees
* Budget - A budget for the family
* CategoryGroup
  * Category
