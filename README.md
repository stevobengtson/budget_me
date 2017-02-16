# Ruby on Rails budgeting application

## License

## Getting started

### Docker setup

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

### Local macOS setup

* Install homebrew
* Install rvm
* `$ rvm install ruby-2.4.0`
* `$ brew install postgresl`
* `$ gem install bundler`
* `$ bundle install`
* Set up the database.yml with connection details (use environment variables)
  * DB\_ENCODING defaults to 'unicode'
  * RAILS\_MAX\_THREADS defaults to 5
  * DB\_USER defaults to 'budgetme'
  * DB\_PASSWORD defaults to 'password'
  * DB\_HOST defaults to 'localhost'
* `$ rails db:create`
* `$ rails db:setup`

Test with: `$ rails test`

Needed:

* Accounts - The accounts used for budgeting (can be excluded from budget just for tracking)
  * Transaction - This is a single transaction record in an account (link to other transactions for transfers)
  * RecurringTransaction - RecurringTransactions, these will become a Transaction
* CategoryGroup
  * Category
* Budget - A budget for the user
  * Period - A budget period (like Jan 2016, Feb 2017, etc)
    * PeriodCategory - Category values for the period (ie: Period: Jan 2017, Category: Home Phone, budget: 100, spent: 35)
