# frozen_string_literal: true

require 'app_store_connect/version'

version = AppStoreConnect::VERSION

desc "Release app_store_connect-#{version}.gem"
task :release, [:key] do |_task, args|
  args.with_defaults(key: 'rubygems')

  key = args.key.to_sym
  host = {
    rubygems: 'https://rubygems.org',
    github: 'https://rubygems.pkg.github.com/kyledecot'
  }.fetch(key)

  sh %(gem push --key=#{key} --host=#{host} app_store_connect-#{version}.gem)
end
