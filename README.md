
<div align="center">
    <image width="400" align="center"src="https://raw.githubusercontent.com/chrismaltais/chess-pub-api-client/master/documentation/logo.png"/><br/>
</div>

<p align="center">Unofficial Ruby client for the Chess.com Published Data API</p>

## Overview

[chess-pub-api-client](https://rubygems.org/gems/chess-pub-api-client) is an unofficial Ruby client for the [Chess.com Published Data REST API](https://www.chess.com/news/view/published-data-api). It's built with zero non-development dependencies to ensure your application remains lightweight.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chess-pub-api-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chess-pub-api-client

## Usage

Using the client is easy:

```ruby
require 'chess-pub-api-client'

# Check if a player is online
ChessPubApiClient.get_player_online_status("steezymalteezy") # Returns a hash of the parsed JSON result

# Get a player's current Daily Chess games where it's their turn to move
ChessPubApiClient.get_player_current_games_to_move("steezymalteezy") # Returns a hash of the parsed JSON result
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrismaltais/chess-pub-api-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
