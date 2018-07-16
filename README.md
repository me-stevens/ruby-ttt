[![Build Status](https://travis-ci.org/octopusinvitro/ruby-ttt.svg?branch=master)](https://travis-ci.org/octopusinvitro/ruby-ttt)
[![build status](https://gitlab.com/octopusinvitro/ruby-ttt/badges/master/build.svg)](https://gitlab.com/octopusinvitro/ruby-ttt/commits/master)
[![Coverage Status](https://coveralls.io/repos/github/octopusinvitro/ruby-ttt/badge.svg?branch=master)](https://coveralls.io/github/octopusinvitro/ruby-ttt?branch=master)
[![Dependency status](https://badges.depfu.com/badges/ffe99cc3b532813ffe46c3b960b86c58/overview.svg)](https://depfu.com/github/octopusinvitro/ruby-ttt?project=Bundler)
[![Maintainability](https://api.codeclimate.com/v1/badges/d63e47b874ec52e32605/maintainability)](https://codeclimate.com/github/octopusinvitro/ruby-ttt/maintainability)


# TicTacToe in Ruby

TDD TTT in Ruby.

## How to use this project

This is a Ruby project.
You will need to tell your favourite Ruby version manager to set your local Ruby version to the one specified in the `Gemfile`.

For example, if you are using [rbenv](https://cbednarski.com/articles/installing-ruby/):

1. Install the right Ruby version:
```bash
$ rbenv install < VERSION >
$ rbenv rehash
```
1. Move to the root directory of this project and type:
```bash
$ rbenv local < VERSION >
$ ruby -v
```

You will also need to install the `bundler` gem, which will allow you to install the rest of the dependencies listed in the `Gemfile` file of this project.

```bash
$ gem install bundler
$ rbenv rehash
```


### Folder structure

* `bin `: Executables
* `lib `: Sources
* `spec`: Tests


### To initialise the project

```bash
bundle install
```


### To run the app

Make sure that the `bin/app` file has execution permissions:

```bash
$ chmod +x bin/app
```

Then just type:

```bash
$ bin/app
```


## Tests


### To run all tests and rubocop

```bash
bundle exec rake
```


### To run one file


```bash
bundle exec rspec path/to/test/file.rb
```


### To run one test

```bash
bundle exec rspec path/to/test/file.rb:TESTLINENUMBER
```


## License

[![License](https://img.shields.io/badge/gnu-license-green.svg?style=flat)](https://opensource.org/licenses/GPL-2.0)
GNU License
