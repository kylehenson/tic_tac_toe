# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/runner'
# require './lib/game'
# require './lib/messages'
#
# class RunnerTest < Minitest::Test
#   attr_reader :runner, :game
#
#   def setup
#     @runner = Runner.new
#     @game = Game.new
#   end
#
#   def test_it_does_not_skip_turn_on_bad_user_input
#     input = 1
#     assert_equal "O", game.get_human_spot(input)
#     assert_equal "O", game.get_human_spot(input)
#   end
# end
