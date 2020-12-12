require 'net/http'
require 'json'

module ChessPubApiClient
  class << self
    def get_player(username)
      uri = URI("https://api.chess.com/pub/player/#{username}")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_titled_players(title)
      uri = URI("https://api.chess.com/pub/titled/#{title}")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_stats(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/stats")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end
    
    def get_player_online_status(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/is-online")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_current_games(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/games")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_current_games_to_move(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/games/to-move")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_games_archives(username, year: nil, month: nil)
      if year && month
        uri = URI("https://api.chess.com/pub/player/#{username}/games/#{year}/#{month}")
      else
        uri = URI("https://api.chess.com/pub/player/#{username}/games/archives")
      end
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_games_archives_pgn(username, year: nil, month: nil)
      # TODO: Set appropriate headers required here
      uri = URI("https://api.chess.com/pub/player/#{username}/games/#{year}/#{month}/pgn")
      res = Net::HTTP.get_response(uri)
      case res.code
      when "200"
        return res.body
      else
        raise StandardError.new("Error. HTTP Status Code: #{res.code}. JSON body: #{res.body}")
      end
    end

    def get_player_clubs(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/clubs")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_matches(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/matches")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_player_tournaments(username)
      uri = URI("https://api.chess.com/pub/player/#{username}/tournaments")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_club(url_id)
      uri = URI("https://api.chess.com/pub/club/#{url_id}")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_club_members(url_id)
      uri = URI("https://api.chess.com/pub/club/#{url_id}/members")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_club_matches(url_id)
      uri = URI("https://api.chess.com/pub/club/#{url_id}/matches")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_tournament(url_id, round: nil, group: nil)
      if round && group
        uri = URI("https://api.chess.com/pub/tournament/#{url_id}/#{round}/#{group}")
      elsif round 
        uri = URI("https://api.chess.com/pub/tournament/#{url_id}/#{round}")
      else
        uri = URI("https://api.chess.com/pub/tournament/#{url_id}")
      end

      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_team_match(id, board: nil)
      if board
        uri = URI("https://api.chess.com/pub/match/#{id}/#{board}")
      else
        uri = URI("https://api.chess.com/pub/match/#{id}")
      end

      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_team_live_match(id, board: nil)
      if board
        uri = URI("https://api.chess.com/pub/match/live/#{id}/#{board}")
      else
        uri = URI("https://api.chess.com/pub/match/live/#{id}")
      end
      
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_country(iso)
      uri = URI("https://api.chess.com/pub/country/#{iso}")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_country_players(iso)
      uri = URI("https://api.chess.com/pub/country/#{iso}/players")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_country_clubs(iso)
      uri = URI("https://api.chess.com/pub/country/#{iso}/clubs")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_daily_puzzle
      uri = URI("https://api.chess.com/pub/puzzle")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_daily_puzzle_random
      uri = URI("https://api.chess.com/pub/puzzle/random")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end
    
    def get_streamers
      uri = URI("https://api.chess.com/pub/streamers")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end

    def get_leaderboards
      uri = URI("https://api.chess.com/pub/leaderboards")
      res = Net::HTTP.get_response(uri)
      handle_response(res)
    end
    
    private

    def handle_response(response)
      case response.code
      when "200"
        return JSON.parse(response.body, symbolize_names: true)
      else
        raise StandardError.new("Error. HTTP Status Code: #{response.code}. JSON body: #{response.body}")
      end
    end
  end
end
