# frozen_string_literal: true

require 'pry'
require 'app_store_connect'

desc 'Start a pry console'
task :console do
  Pry.start(AppStoreConnect::Client.new)
end
