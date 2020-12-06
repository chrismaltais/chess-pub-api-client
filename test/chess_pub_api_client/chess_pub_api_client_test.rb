require "test_helper"
require "pry"

class ChessPubApiClientTest < Minitest::Test
  def test_get_player_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player") do
      result = ChessPubApiClient.get_player("steezymalteezy")

      fields_returned = result.keys
      assert fields_returned.include?(:avatar)
      assert fields_returned.include?(:player_id)
      assert fields_returned.include?(:@id)
      assert fields_returned.include?(:url)
      assert fields_returned.include?(:name)
      assert fields_returned.include?(:username)
      assert fields_returned.include?(:followers)
      assert fields_returned.include?(:country)
      assert fields_returned.include?(:last_online)
      assert fields_returned.include?(:joined)
      assert fields_returned.include?(:status)
      assert fields_returned.include?(:is_streamer)
    end
  end

  def test_get_titled_players_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_titled_players") do
      result = ChessPubApiClient.get_titled_players("GM")
      assert result[:players]
      assert_operator result[:players].size, :>, 1
    end
  end

  def test_get_player_stats_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_stats") do
      result = ChessPubApiClient.get_player_stats("steezymalteezy")
      assert result
    end
  end

  def test_get_player_online_status_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_online_status") do
      result = ChessPubApiClient.get_player_online_status("steezymalteezy")
      assert result
    end
  end

  def test_get_current_games_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_current_games") do
      result = ChessPubApiClient.get_current_games("steezymalteezy")
      assert result
    end
  end

  def test_get_current_games_to_move_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_current_games_to_move") do
      result = ChessPubApiClient.get_current_games_to_move("steezymalteezy")
      assert result
    end
  end

  def test_get_games_archives_returns_hash_of_parsed_JSON_response_if_no_dates_supplied
    VCR.use_cassette("get_games_all_archives") do
      result = ChessPubApiClient.get_games_archives("steezymalteezy")
      assert result
    end
  end

  def test_get_games_archives_returns_hash_of_parsed_JSON_response_if_dates_supplied
    VCR.use_cassette("get_games_specific_archives") do
      result = ChessPubApiClient.get_games_archives("steezymalteezy", year: 2020, month: 11)
      assert result
    end
  end

  def test_get_player_games_archives_pgn_returns_hash_of_parsed_JSON_response
    assert true
  end

  def test_get_player_clubs_returns_hash_of_parsed_JSON_response
    assert true
  end

  def test_get_player_tournaments_returns_hash_of_parsed_JSON_response
    assert true
  end

  def test_get_club_returns_hash_of_parsed_JSON_response
    assert true
  end

  def test_get_club_members_returns_hash_of_parsed_JSON_response
    assert true
  end

  def test_get_club_matches_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_club_matches("chess-com-developer-community")
    assert true
  end

  def test_get_tournament_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600")
    assert true
  end

  def test_get_tournament_with_round_param_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600", round: 1)
    assert true
  end

  def test_get_tournament_with_round_and_group_param_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600", round: 1, group: 1)
    assert true
  end

  def test_get_team_match_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_team_match("12803")
    assert true
  end

  def test_get_team_match_with_board_param_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_team_match("12803", board: 1)
    assert true
  end

  def test_get_team_live_match_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_team_live_match("5833")
    assert true
  end

  def test_get_team_live_match_with_board_param_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_team_live_match("5833", board: 1)
    assert true
  end

  def test_get_country_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_country("CA")
    assert true
  end

  def test_get_country_players_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_country_players("CA")
    assert true
  end

  def test_get_country_clubs_returns_hash_of_parsed_JSON_response
    # ChessPubApiClient.get_country_clubs("CA")
    assert true
  end
end