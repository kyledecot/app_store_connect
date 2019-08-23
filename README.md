# App Store Connect 

[![Build Status](https://travis-ci.com/kyledecot/app_store_connect.svg?branch=master)](https://travis-ci.com/kyledecot/app_store_connect) [![Gem Version](https://badge.fury.io/rb/app_store_connect.svg)](https://badge.fury.io/rb/app_store_connect) [![Maintainability](https://api.codeclimate.com/v1/badges/eb09ffa68f84f8da0b6d/maintainability)](https://codeclimate.com/github/kyledecot/app_store_connect/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/eb09ffa68f84f8da0b6d/test_coverage)](https://codeclimate.com/github/kyledecot/app_store_connect/test_coverage)

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
AppStoreConnect.config = {
  issuer_id: issuer_id,
  key_id: key_id,
  private_key: private_key
}

app_store_connect = AppStoreConnect::Client.new

app_store_connect.apps 
app_store_connect.app(id: '1234')
app_store_connect.builds(id: '1234')
```

## Endpoints

#### Users and Roles

##### Users

- [x] List Invited Users
- [x] Read User Invitation Information
- [x] Invite a User
- [ ] Cancel a User Invitation

##### User Invitations


#### Reporting

##### Sales and Finance Reports

- [x] Finance Reports
- [x] Sales Reports

### Register Device 

```ruby 
app_store_connect.create_device(
  name: 'Kyle Decot\'s iPhone',
  udid: '...'
)
```

### Create Bundle ID

```ruby
app_store_connect.create_bundle_id(
  name: 'Example', 
  identifier: 'com.kyledecot.Example', 
  platform: 'IOS'
) 
```

### Sales Reports

```ruby
app_store_connect.sales_reports(
  filter: {
    report_type: 'SALES',
    report_sub_type: 'SUMMARY',
    frequency: 'DAILY',
    vendor_number: '123456'
  }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyledecot/app_store_connect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
