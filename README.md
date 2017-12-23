# README

Heroku Link:
https://fork-friendly-app.herokuapp.com/

If you want to modify the codes in this project, fork this repo to your own GitHub account, and then
clone your fork:

```sh
$ git clone git@github.com:your_github_username/sankeerth/Fork_Friendly_app.git
```
Then you should run Bundler, to make sure all the app's gems are installed.  Switch to the app's root directory (presumably `Fork_Friendly_app`) and run `bundle install` 

Finally, to get the local database created, run:

```sh
$ rake db:migrate
```

Now insert "seed data" into the database--initial data items that the app needs to run:

```sh
$ rake db:seed
```

<br />


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
