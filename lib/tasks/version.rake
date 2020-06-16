# frozen_string_literal: true

require 'app_store_connect/version'
require 'semantic'

namespace :version do
  desc 'Print current version'
  task :current do
    puts AppStoreConnect::VERSION
  end

  desc 'Increment version'
  task :increment do
    version = Semantic::Version.new(AppStoreConnect::VERSION)
    path = File.expand_path(File.join('..', 'app_store_connect', 'version.rb'), __dir__)

    File.open(path, 'r+') do |file|
      contents = file.read
      contents.gsub!(AppStoreConnect::VERSION, version.increment!(:minor).to_s)

      file.rewind
      file.write(contents)
    end
  end
end
