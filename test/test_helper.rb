$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "chess_pub_api_client"
require "chess_pub_api_client/chess_pub_api_client"

# dependencies
require "minitest/autorun"
require "pry"
require "vcr"

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
