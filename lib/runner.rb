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
      messages.print_turn_identifier
      get_input
      get_computer_spot
    end

    if game.game_is_over(game.board)
      messages.game_over
    else
      messages.game_tie
    end
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

  def get_computer_spot
    if !game.game_is_over(game.board) && !game.tie(game.board)
      game.eval_board
      messages.print_computer_spot(game.computer_spot)
    end
    messages.print_board(game.board)
  end
end

runner = Runner.new
runner.start_game
