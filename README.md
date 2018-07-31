# Test App Ruby

Test task for Aejis by Olya Kovtun

## Setup

Install dependencies

    $ gem install bundler
    $ bundle install

Setup database

    $ rake db:create
    $ rake db:migrate
    $ rake db:seed

## Development

Start rails server on http://localhost:3000

    $ rails s

Users

- admin@example.com
- manager@example.com
- user@example.com

password for all users 12345678

## Testing

    $ rspec
