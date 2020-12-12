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

      root_fields = result.keys
      assert root_fields.include?(:chess_daily)
      assert root_fields.include?(:chess_rapid)
      assert root_fields.include?(:chess_bullet)
      assert root_fields.include?(:tactics)
      assert root_fields.include?(:lessons)
      assert root_fields.include?(:puzzle_rush)
    end
  end

  def test_get_player_online_status_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_online_status") do
      result = ChessPubApiClient.get_player_online_status("steezymalteezy")

      root_fields = result.keys
      assert root_fields.include?(:online)
    end
  end

  def test_get_player_current_games_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_current_games") do
      result = ChessPubApiClient.get_player_current_games("steezymalteezy")

      root_fields = result.keys
      assert root_fields.include?(:games)
    end
  end

  def test_get_player_current_games_to_move_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_current_games_to_move") do
      result = ChessPubApiClient.get_player_current_games_to_move("steezymalteezy")

      root_fields = result.keys
      assert root_fields.include?(:games)
    end
  end

  def test_get_player_games_archives_returns_hash_of_parsed_JSON_response_if_no_dates_supplied
    VCR.use_cassette("get_player_games_archives") do
      result = ChessPubApiClient.get_player_games_archives("steezymalteezy")

      root_fields = result.keys
      assert root_fields.include?(:archives)
    end
  end

  def test_get_player_games_archives_returns_hash_of_parsed_JSON_response_if_dates_supplied
    VCR.use_cassette("get_player_games_archives_with_year_and_month_params") do
      result = ChessPubApiClient.get_player_games_archives("steezymalteezy", year: 2020, month: 11)
    
      root_fields = result.keys
      assert root_fields.include?(:games)
    end
  end

  def test_get_player_games_archives_pgn_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_games_archives_pgn") do
      result = ChessPubApiClient.get_player_games_archives_pgn("steezymalteezy", year: 2020, month: 11)
      assert_instance_of String, result
    end
  end

  def test_get_player_clubs_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_clubs") do
      result = ChessPubApiClient.get_player_clubs("steezymalteezy")
    
      root_fields = result.keys
      assert root_fields.include?(:clubs)
    end
  end

  def test_get_player_matches_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_matches") do
      result = ChessPubApiClient.get_player_matches("steezymalteezy")
    
      root_fields = result.keys
      assert root_fields.include?(:finished)
      assert root_fields.include?(:in_progress)
      assert root_fields.include?(:registered)
    end
  end

  def test_get_player_tournaments_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_player_tournaments") do
      result = ChessPubApiClient.get_player_tournaments("steezymalteezy")
    
      root_fields = result.keys
      assert root_fields.include?(:finished)
      assert root_fields.include?(:in_progress)
      assert root_fields.include?(:registered)
    end
  end

  def test_get_club_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_club") do
      result = ChessPubApiClient.get_club("chess-com-developer-community")
    
      root_fields = result.keys
      assert root_fields.include?(:@id)
      assert root_fields.include?(:name)
      assert root_fields.include?(:club_id)
      assert root_fields.include?(:country)
      assert root_fields.include?(:average_daily_rating)
      assert root_fields.include?(:members_count)
      assert root_fields.include?(:created)
      assert root_fields.include?(:last_activity)
      assert root_fields.include?(:admin)
      assert root_fields.include?(:visibility)
      assert root_fields.include?(:join_request)
      assert root_fields.include?(:icon)
      assert root_fields.include?(:description)
      assert root_fields.include?(:url)
    end
  end

  def test_get_club_members_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_club_members") do
      result = ChessPubApiClient.get_club_members("chess-com-developer-community")
    
      root_fields = result.keys
      assert root_fields.include?(:weekly)
      assert root_fields.include?(:monthly)
      assert root_fields.include?(:all_time)
    end
  end

  def test_get_club_matches_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_club_matches") do
      result = ChessPubApiClient.get_club_matches("chess-com-developer-community")
    
      root_fields = result.keys
      assert root_fields.include?(:finished)
      assert root_fields.include?(:in_progress)
      assert root_fields.include?(:registered)
    end
  end

  def test_get_tournament_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_tournament") do
      result = ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600")
    
      root_fields = result.keys
      assert root_fields.include?(:name)
      assert root_fields.include?(:url)
      assert root_fields.include?(:description)
      assert root_fields.include?(:creator)
      assert root_fields.include?(:status)
      assert root_fields.include?(:finish_time)
      assert root_fields.include?(:settings)
      assert root_fields.include?(:players)
      assert root_fields.include?(:rounds)
    end
  end

  def test_get_tournament_with_round_param_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_tournament_with_round_param") do
      result = ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600", round: 1)

      root_fields = result.keys
      assert root_fields.include?(:groups)
      assert root_fields.include?(:players)
    end
  end

  def test_get_tournament_with_round_and_group_params_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_tournament_with_round_and_group_params") do
      result = ChessPubApiClient.get_tournament("-33rd-chesscom-quick-knockouts-1401-1600", round: 1, group: 1)

      root_fields = result.keys
      assert root_fields.include?(:fair_play_removals)
      assert root_fields.include?(:games)
      assert root_fields.include?(:players)
    end
  end

  def test_get_team_match_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_team_match") do
      result = ChessPubApiClient.get_team_match("12803")

      root_fields = result.keys
      assert root_fields.include?(:@id)
      assert root_fields.include?(:name)
      assert root_fields.include?(:url)
      assert root_fields.include?(:start_time)
      assert root_fields.include?(:end_time)
      assert root_fields.include?(:status)
      assert root_fields.include?(:boards)
      assert root_fields.include?(:settings)
      assert root_fields.include?(:teams)
    end
  end

  def test_get_team_match_with_board_param_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_team_match_with_board_param") do
      result = ChessPubApiClient.get_team_match("12803", board: 1)

      root_fields = result.keys
      assert root_fields.include?(:board_scores)
      assert root_fields.include?(:games)
    end
  end

  def test_get_team_live_match_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_team_live_match") do
      result = ChessPubApiClient.get_team_live_match("5833")

      root_fields = result.keys
      assert root_fields.include?(:@id)
      assert root_fields.include?(:name)
      assert root_fields.include?(:url)
      assert root_fields.include?(:start_time)
      assert root_fields.include?(:end_time)
      assert root_fields.include?(:status)
      assert root_fields.include?(:boards)
      assert root_fields.include?(:settings)
      assert root_fields.include?(:teams)
    end
  end

  def test_get_team_live_match_with_board_param_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_team_live_match_with_board_param") do
      result = ChessPubApiClient.get_team_match("5833", board: 1)

      root_fields = result.keys
      assert root_fields.include?(:board_scores)
      assert root_fields.include?(:games)
    end
  end

  def test_get_country_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_country") do
      result = ChessPubApiClient.get_country("CA")

      root_fields = result.keys
      assert root_fields.include?(:@id)
      assert root_fields.include?(:code)
      assert root_fields.include?(:name)
    end
  end

  def test_get_country_players_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_country_players") do
      result = ChessPubApiClient.get_country_players("CA")

      root_fields = result.keys
      assert root_fields.include?(:players)
    end
  end

  def test_get_country_clubs_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_country_clubs") do
      result = ChessPubApiClient.get_country_clubs("CA")

      root_fields = result.keys
      assert root_fields.include?(:clubs)
    end
  end

  def test_get_streamers_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_streamers") do
      result = ChessPubApiClient.get_streamers

      root_fields = result.keys
      assert root_fields.include?(:streamers)
    end
  end

  def test_get_leaderboards_returns_hash_of_parsed_JSON_response
    VCR.use_cassette("get_leaderboards") do
      result = ChessPubApiClient.get_leaderboards

      root_fields = result.keys
      assert root_fields.include?(:daily)
      assert root_fields.include?(:daily960)
      assert root_fields.include?(:live_rapid)
      assert root_fields.include?(:live_blitz)
      assert root_fields.include?(:live_bullet)
      assert root_fields.include?(:live_bughouse)
      assert root_fields.include?(:live_blitz960)
      assert root_fields.include?(:live_threecheck)
      assert root_fields.include?(:live_crazyhouse)
      assert root_fields.include?(:live_kingofthehill)
      assert root_fields.include?(:tactics)
    end
  end
end