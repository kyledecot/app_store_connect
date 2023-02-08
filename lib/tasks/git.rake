# frozen_string_literal: true

namespace :git do
  task :add, [:extra] do |_task, args|
    `git add #{args[:extra]}`
  end

  task :commit, [:message] do |_task, args|
    `git commit -m "#{args[:message]}"`
  end

  task :tag, [:tag] do |_task, args|
    `git tag #{args[:tag]}`
  end

  task :push, [:extra] do |_task, args|
    system `git push #{args[:extra]}`
  end
end
