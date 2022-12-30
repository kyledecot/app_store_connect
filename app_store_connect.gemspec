# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'app_store_connect/version'

Gem::Specification.new do |spec|
  spec.name          = 'app_store_connect'
  spec.version       = AppStoreConnect::VERSION
  spec.authors       = ['Kyle Decot']
  spec.email         = ['kyle.decot@icloud.com']

  spec.summary       = 'A Ruby interface to the App Store Connect API'
  spec.homepage      = 'https://github.com/kyledecot/app_store_connect'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7.0'

  spec.add_runtime_dependency 'activesupport', '>= 6.0.0'
  spec.add_runtime_dependency 'jwt', '>= 1.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'factory_bot', '~> 6.2.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.3'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.11.0'
  spec.add_development_dependency 'rubocop', '~> 1.36.0'
  spec.add_development_dependency 'semantic', '~> 1.6.1'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'timecop', '~> 0.9.5'
  spec.add_development_dependency 'webmock', '~> 3.18.1'
end
