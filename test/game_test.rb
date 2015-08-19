require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

require 'pry'

class GameTest < Minitest::Test
  attr_reader :game

  def setup
    @game = Game.new
  end

  def test_it_initializes_with_a_board
    board_setup = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    assert_equal board_setup, game.board
  end

  def test_it_initializes_with_a_computer
    assert_equal "X", game.computer
  end

  def test_it_initializes_with_a_human
    assert_equal "O", game.human
  end
  # def test_can_recognize_a_tie
  #   game = Game.new
  # end
end
