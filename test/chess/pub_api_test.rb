require "test_helper"

class Chess::PubApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Chess::PubApi::VERSION
  end
end
