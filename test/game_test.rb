require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

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

  def test_it_plays_human_actions_on_the_grid
    game.get_human_spot(1)
    assert_equal "O", game.board[1]
    assert_equal "0", game.board[0]
    assert_equal "2", game.board[2]
    assert_equal "3", game.board[3]
    assert_equal "4", game.board[4]
    assert_equal "5", game.board[5]
    assert_equal "6", game.board[6]
    assert_equal "7", game.board[7]
    assert_equal "8", game.board[8]
  end

  def test_it_plays_computer_actions_on_the_grid
    game.get_human_spot(1)
    assert_equal "O", game.board[1]
    assert_equal "0", game.board[0]
    assert_equal "2", game.board[2]
    assert_equal "3", game.board[3]
    assert_equal "4", game.board[4]
    assert_equal "5", game.board[5]
    assert_equal "6", game.board[6]
    assert_equal "7", game.board[7]
    assert_equal "8", game.board[8]
  end

  def test_it_does_recognizes_bad_user_input
    game.get_human_spot(1)
    assert_equal "O", game.board[1]
    assert_equal false, game.bad_spot

    game.get_human_spot(1)
    assert_equal true, game.bad_spot

    game.get_human_spot(123)
    assert_equal true, game.bad_spot
  end
end
