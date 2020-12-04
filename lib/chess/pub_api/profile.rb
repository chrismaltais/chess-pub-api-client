require 'net/http'
require 'json'

module Chess
  module PubApi
    class Profile
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

        def get_current_games(username)
          uri = URI("https://api.chess.com/pub/player/#{username}/games")
          res = Net::HTTP.get_response(uri)
          handle_response(res)
        end

        private

        def handle_response(response)
          case response.code
          when "200"
            return JSON.parse(response.body)
          else
            raise StandardError.new("Error. HTTP Status Code: #{response.code}. JSON body: #{response.body}")
          end
        end

      end
    end
  end
end