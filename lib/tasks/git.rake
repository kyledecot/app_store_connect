# frozen_string_literal: true

namespace :git do
  task :add, [:flags] do |_task, args|
    `git add #{args[:flags]}`
  end

  task :commit, [:message] do |_task, args|
    `git commit -m "#{args[:message]}"`
  end
end
