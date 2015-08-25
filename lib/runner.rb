require 'pry'

require_relative 'messages'
require_relative 'game'

class Runner
  attr_reader :messages, :game

  def initialize
    @messages = Messages.new
    @game = Game.new
  end

  def start_game
    messages.welcome(game.board)
    until game.game_is_over(game.board) || game.tie(game.board)
      get_input
      if !game.game_is_over(game.board) && !game.tie(game.board)
        game.eval_board
      end
      messages.print_board(game.board)
    end
    messages.game_over
  end

  def get_input
    input = gets.chomp.to_i
    game.get_human_spot(input)
    if game.bad_spot
      ask_human_for_new_play
    end
  end

  def ask_human_for_new_play
    messages.bad_input
    get_input
  end

end

runner = Runner.new
# runner.start_game
