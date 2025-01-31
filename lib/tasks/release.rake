# frozen_string_literal: true

require 'app_store_connect/version'

desc 'Release'
task :release do
  version_increment, = Rake::Task['version:increment'].invoke
  version = version_increment.call

  Rake::Task['bundle:install'].invoke
  Rake::Task['git:add'].invoke('-A')
  Rake::Task['git:commit'].invoke("v#{version}")
  Rake::Task['git:tag'].invoke("v#{version}")
  Rake::Task['git:push'].invoke('origin main')
  Rake::Task['git:push'].invoke("origin v#{version}")
end
