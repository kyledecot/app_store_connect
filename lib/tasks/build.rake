# frozen_string_literal: true

require 'app_store_connect/version'

desc "Build app_store_connect-#{AppStoreConnect::VERSION}.gem"
task :build do
  sh %(gem build app_store_connect.gemspec)
end
