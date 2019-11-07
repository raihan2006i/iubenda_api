lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "iubenda_api/version"

Gem::Specification.new do |spec|
  spec.name          = "iubenda_api"
  spec.version       = IubendaApi::VERSION
  spec.authors       = ["Raihan Mahmud Arman"]
  spec.email         = ["raihan2006i@gmail.com"]

  spec.summary       = %q{Iubenda ruby client for HTTP API}
  spec.homepage      = "https://github.com/raihan2006i/iubenda_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'api_struct'
  spec.add_dependency 'dry-configurable'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.7.6"
  spec.add_development_dependency "dotenv", "~> 2.7.5"
end
