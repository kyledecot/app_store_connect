# App Store Connect [![Build Status](https://travis-ci.com/kyledecot/app_store_connect.svg?branch=master)](https://travis-ci.com/kyledecot/app_store_connect) [![Gem Version](https://badge.fury.io/rb/app_store_connect.svg)](https://badge.fury.io/rb/app_store_connect)

A Ruby interface to the [App Store Connect API](https://developer.apple.com/app-store-connect/api/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_store_connect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_store_connect

## Usage

```ruby 
client = AppStoreConnect::Client.new(
  issuer_id: issuer_id,
  key_id: key_id,
  private_key: private_key
)

client.apps 
client.app('1234')
client.builds('1234')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyledecot/app_store_connect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
