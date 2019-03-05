
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "app_store_connect/version"

Gem::Specification.new do |spec|
  spec.name          = "app_store_connect"
  spec.version       = AppStoreConnect::VERSION
  spec.authors       = ["Kyle Decot"]
  spec.email         = ["kyle.decot@icloud.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/kyledecot/app_store_connect"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.16"
  spec.add_runtime_dependency "jwt", "~> 2.1"
  spec.add_runtime_dependency "gli", "~> 2.17"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.12"
end
