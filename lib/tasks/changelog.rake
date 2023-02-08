require 'github_changelog_generator/task'

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = 'kyledecot'
  config.project = 'app_store_connect'
  # config.since_tag = 'v0.1.0'
  # config.future_release = 'v0.33.0'
end