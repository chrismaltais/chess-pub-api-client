require "test_helper"
require "pry"

module Chess::PubApi
  class ProfileTest < Minitest::Test
    def test_get_player_returns_hash_of_parsed_JSON_result
      result = ::Chess::PubApi::Profile.get_player("steezymalteezy")

      fields_returned = result.keys
      assert fields_returned.include?("avatar")
      assert fields_returned.include?("player_id")
      assert fields_returned.include?("@id")
      assert fields_returned.include?("url")
      assert fields_returned.include?("name")
      assert fields_returned.include?("username")
      assert fields_returned.include?("followers")
      assert fields_returned.include?("country")
      assert fields_returned.include?("last_online")
      assert fields_returned.include?("joined")
      assert fields_returned.include?("status")
      assert fields_returned.include?("is_streamer")
    end

    def test_get_titled_players_returns_hash_of_parsed_JSON_result
      result = ::Chess::PubApi::Profile.get_titled_players("GM")
      assert result["players"]
      assert_operator result["players"].size, :>, 1
    end

    def test_get_player_stats_returns_hash_of_parsed_JSON_result
      result = ::Chess::PubApi::Profile.get_player_stats("steezymalteezy")
      assert result
    end

    def test_get_player_online_status_returns_hash_of_parsed_JSON_result
      result = ::Chess::PubApi::Profile.get_player_online_status("steezymalteezy")
      assert result
    end

    def test_get_current_games_returns_hash_of_parsed_JSON_result
      result = ::Chess::PubApi::Profile.get_current_games("steezymalteezy")
      assert result
    end
  end
end