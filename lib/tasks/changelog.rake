# frozen_string_literal: true

require 'github_changelog_generator'

task :changelog, [:release] do |_task, args|
  options = GitHubChangelogGenerator::Parser.default_options
  options[:user] = 'kyledecot'
  options[:project] = 'app_store_connect'
  options[:future_release] = args[:release]

  generator = GitHubChangelogGenerator::Generator.new(options)

  log = generator.compound_changelog

  output_filename = 'CHANGELOG.md'
  File.open(output_filename, 'w') { |file| file.write(log) }
end
