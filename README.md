# App Store Connect 
[![Test](https://github.com/kyledecot/app_store_connect/workflows/Test/badge.svg)](https://github.com/kyledecot/app_store_connect/actions) [![Gem Version](https://badge.fury.io/rb/app_store_connect.svg)](https://badge.fury.io/rb/app_store_connect) [![Maintainability](https://api.codeclimate.com/v1/badges/eb09ffa68f84f8da0b6d/maintainability)](https://codeclimate.com/github/kyledecot/app_store_connect/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/eb09ffa68f84f8da0b6d/test_coverage)](https://codeclimate.com/github/kyledecot/app_store_connect/test_coverage)

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

## Web Service Endpoints


### Users
- [X] List Users
- [X] Read User Information
- [X] Remove a User Account
- [X] Modify a User Account
- [X] Get All Visible App Resource IDs for a User
- [X] List All Apps Visible to a User
- [X] Remove Visible Apps from a User
- [X] Add Visible Apps to a User
- [X] Replace the List of Visible Apps for a User

### Bundle IDs
- [X] Register a New Bundle ID
- [X] Modify a Bundle ID
- [X] Delete a Bundle ID
- [X] Read Bundle ID Information
- [X] List Bundle IDs
- [X] Get All Profile IDs for a Bundle ID
- [X] Get All Capabilility IDs for a Bundle ID
- [X] List All Profiles for a Bundle ID
- [X] List All Capabilities for a Bundle ID

### Certificates
- [X] List and Download Certificates
- [X] Create a Certificate
- [X] Read and Download Certificate Information
- [X] Revoke a Certificate

### User Invitations
- [X] Read User Invitation Information
- [X] List Invited Users
- [X] Invite a User
- [X] Cancel a User Invitation
- [X] Get All App Resource IDs Visible to an Invited User
- [X] List All Apps Visible to an Invited User

### Bundle ID Capabilities
- [ ] Enable a Capability
- [X] Disable a Capability
- [X] Modify a Capability Configuration

### Devices
- [X] List Devices
- [X] Read Device Information
- [X] Register a New Device
- [X] Modify a Registered Device

### Sales and Finance Reports
- [X] Download Sales and Trends Reports
- [X] Download Finance Reports

### Profiles
- [X] Create a Profile
- [X] Delete a Profile
- [X] List and Download Profiles
- [X] Get the Bundle Resource ID in a Profile
- [X] Read the Bundle ID in a Profile
- [X] Read and Download Profile Information
- [X] List All Certificates in a Profile
- [X] Get All Certificate IDs in a Profile
- [X] Get All Device Resource IDs in a Profile
- [X] List All Devices in a Profile

### Beta Testers
- [X] Create a Beta Tester
- [X] Delete a Beta Tester
- [X] Add a Beta Tester to Beta Groups
- [X] List Beta Testers
- [X] Read Beta Tester Information
- [X] Individually Assign a Beta Tester to Builds
- [X] Remove a Beta Tester from Beta Groups
- [X] Remove a Beta Testerâs Access to Apps
- [X] Get All App Resource IDs for a Beta Tester
- [X] List All Builds Individually Assigned to a Beta Tester
- [X] List All Apps for a Beta Tester
- [X] Get All IDs of Builds Individually Assigned to a Beta Tester
- [X] List All Beta Groups to Which a Beta Tester Belongs
- [X] Get All Beta Group IDs of a Beta Tester's Groups
- [X] Individually Unassign a Beta Tester from Builds

### Beta Tester Invitations
- [ ] Send an Invitation to a Beta Tester

### Apps
- [X] Remove Beta Testers from All Groups and Builds of an App
- [X] Read App Information
- [X] List All Beta Groups for an App
- [X] List Apps
- [X] Get All Build IDs of an App
- [X] List All Builds of an App
- [X] Get All Beta Group IDs for an App
- [X] Get All Prerelease Version IDs for an App
- [X] List All Prerelease Versions for an App
- [X] Get the Beta App Review Details Resource ID for an App
- [X] Read the Beta App Review Details Resource of an App
- [X] List All Beta App Localizations of an App
- [X] Read the Beta License Agreement of an App
- [X] Get the Beta License Agreement ID for an App
- [X] Get All Beta App Localization IDs of an App

### Beta Groups
- [X] Create a Beta Group
- [X] Modify a Beta Group
- [X] List Beta Groups
- [X] Read Beta Group Information
- [X] Delete a Beta Group
- [X] Read the App Information of a Beta Group
- [X] Get the App Resource ID for a Beta Group
- [X] Add Beta Testers to a Beta Group
- [X] Remove Beta Testers from a Beta Group
- [X] Remove Builds from a Beta Group
- [X] List All Builds for a BetaGroup
- [X] Add Builds to a Beta Group
- [X] Get All Build IDs in a Beta Group
- [X] Get All Beta Tester IDs in a Beta Group
- [X] List All Beta Testers in a BetaGroup

### Prerelease Versions
- [X] List Prerelease Versions
- [X] Get the App Resource ID for a Prerelease Version
- [X] Read Prerelease Version Information
- [X] Read the App Information of a Prerelease Version
- [X] List All Builds of a Prerelease Version
- [X] Get All Build IDs of a Prerelease Version

### Beta App Localizations
- [X] List Beta App Localizations
- [X] Read Beta App Localization Information
- [X] Read the App Information of a Beta App Localization
- [X] Get the App Resource ID for a Beta App Localization
- [X] Create a Beta App Localization
- [X] Modify a Beta App Localization
- [X] Delete a Beta App Localization

### App Encryption Declarations
- [X] List App Encryption Declarations
- [X] Read App Encryption Declaration Information
- [X] Get the App Resource ID for an App Encryption Declaration
- [X] Read the App Information of an App Encryption Declaration
- [ ] Assign Builds to an App Encryption Declaration

### Build Beta Details
- [X] Read Build Beta Detail Information
- [X] List Build Beta Details
- [X] Get the Build ID for a Build Beta Detail
- [X] Modify a Build Beta Detail
- [X] Read the Build Information of a Build Beta Detail

### Beta Build Localizations
- [X] List Beta Build Localizations
- [X] Read Beta Build Localization Information
- [X] Read the Build Information of a Beta Build Localization
- [X] Create a Beta Build Localization
- [X] Delete a Beta Build Localization
- [X] Modify a Beta Build Localization
- [X] Get the Build ID for a Beta Build Localization

### Builds
- [X] Read Build Information
- [X] Get the App Resource ID for a Build
- [X] List Builds
- [X] Read the App Information of a Build
- [X] Modify a Build
- [X] Read the Prerelease Version of a Build
- [X] Get All Resource IDs of Prerelease Versions for a Build
- [X] Assign the App Encryption Declaration for a Build
- [X] Remove Individual Testers from a Build
- [X] Add Access for Beta Groups to a Build
- [X] Remove Access for Beta Groups to a Build
- [X] List All Individual Testers for a Build
- [X] Assign Individual Testers to a Build
- [X] Get All Resource IDs of Individual Testers for a Build
- [X] Get the Beta App Review Submission ID of a Build
- [X] Read the Beta App Review Submission of a Build
- [X] Read the Build Beta Details Information of a Build
- [X] Get the Build Beta Details Resource ID for a Build
- [X] Get the App Encryption Declaration ID for a Build
- [X] Get All Beta Build Localization IDs of a Build
- [X] Read the App Encryption Declaration of a Build
- [X] List All Beta Build Localizations of a Build

### Beta App Review Detail
- [X] List Beta App Review Details
- [X] Read Beta App Review Detail Information
- [X] Read the App Information of a Beta App Review Detail
- [X] Get the App Resource ID for a Beta App Review Details Resource
- [X] Modify a Beta App Review Detail

### Beta App Review Submissions
- [X] Read Beta App Review Submission Information
- [X] Submit an App for Beta Review
- [X] Read the Build Information of a Beta App Review Submission
- [X] List Beta App Review Submissions
- [X] Get the Build ID for a Beta App Review Submission

### Build Beta Notifications
- [ ] Send Notification of an Available Build

### Beta License Agreements
- [X] Read Beta License Agreement Information
- [X] Read the App Information of a Beta License Agreement
- [X] Get the App Resource ID for a Beta License Agreement
- [X] Modify a Beta License Agreement
- [X] List Beta License Agreements


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
