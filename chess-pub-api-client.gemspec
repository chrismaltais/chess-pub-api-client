
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chess_pub_api_client/version"

Gem::Specification.new do |spec|
  spec.name          = "chess-pub-api-client"
  spec.version       = ChessPubApiClient::VERSION
  spec.authors       = ["Chris Maltais"]
  spec.email         = ["chris.maltais@hotmail.ca"]

  spec.summary       = "Unofficial Ruby client for the Chess.com Public Data REST API."
  spec.description   = "chess-pub-api-client is a simple zero dependency Ruby client for interfacing with Chess.com's Public Data REST API."
  spec.homepage      = "https://github.com/chrismaltais/chess-pub-api"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr", "~> 6.0.0"
  spec.add_development_dependency "webmock"
end
