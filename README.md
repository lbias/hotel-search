# Find Cheap Hotel

## Dependencies
1. Ruby 2.4.0
1. Rails 5.1.2
1. Bundler 1.15.3

## To launch app locally, launch your terminal.
1. Clone the hotel-search workspace

    `git clone git@github.com:lbias/hotel-search.git`

1. try using a version of ruby 2.4.1

    `rvm install ruby-2.4.0 && rvm use ruby-2.4.0`

1. Install all your gems using bundler

    `bundle install`

1. Create database and run migrations

    `rake db:setup && rake db:migrate`

1. Populate database with data

    `rake db:seed`

1. Run your local rails server

    `rails s`

1. Open your Postman, method get
    - http://localhost:3000/api/v1/search?checkin=20170804&checkout=20170805&guests=Peter&destination=Singapore&suppliers=supplier2
    - http://localhost:3000/api/v1/search?checkin=20170804&checkout=20170805&guests=Peter&destination=Singapore&suppliers=supplier1,supplier3
    - http://localhost:3000/api/v1/search?checkin=20170804&checkout=20170805&guests=Peter&destination=Singapore&suppliers=

1. Result
    - ![](https://ws1.sinaimg.cn/large/006tKfTcly1fi7palbaphj31hc0xcadm.jpg)
    - ![](https://ws4.sinaimg.cn/large/006tKfTcly1fi7pa1m9lvj31hc0xcq6r.jpg)
    - ![](https://ws4.sinaimg.cn/large/006tKfTcly1fi7pb4v58vj31hc0xcae2.jpg)
