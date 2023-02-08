# frozen_string_literal: true

require 'app_store_connect/version'

version = AppStoreConnect::VERSION

desc "Push app_store_connect-#{version}.gem"
task :push, [:key] do |_task, args|
  args.with_defaults(key: 'rubygems')

  key = args.key.to_sym
  host = {
    rubygems: 'https://rubygems.org',
    github: 'https://rubygems.pkg.github.com/kyledecot'
  }.fetch(key)

  sh %(gem push --key=#{key} --host=#{host} app_store_connect-#{version}.gem)
end
