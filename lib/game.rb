class Game
  attr_reader :board, :computer, :human, :bad_spot, :computer_spot

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @computer = "X"
    @human = "O"
  end

  def get_human_spot(input)
    @bad_spot = false
    if @board[input] == nil
      @bad_spot = true
    elsif @board[input] != "X" && @board[input] != "O"
      @board[input] = @human
    else
      @bad_spot = true
    end
  end

  def eval_board
    @computer_spot = nil
    until @computer_spot
      take_center_spot_or_best_move
    end
  end

  def take_center_spot_or_best_move
    if @board[4] == "4"
      @computer_spot = 4
      @board[@computer_spot] = @computer
    else
      @computer_spot = get_best_move(@board, @computer)
      if @board[@computer_spot] != "X" && @board[@computer_spot] != "O"
        @board[@computer_spot] = @computer
      else
        @computer_spot = nil
      end
    end
  end

  def get_best_move(board, next_player)
    best_move = nil
    available_spaces = board.select {|space| space != "X" && space != "O"}
    best_move = calculate_best_move(board, available_spaces)

    if best_move.is_a? Integer
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def calculate_best_move(board, available_spaces)
    available_spaces.each do |available_space|
      board[available_space.to_i] = @computer
      if game_is_over(board)
        best_move = available_space.to_i
        board[available_space.to_i] = available_space
        return best_move
      else
        board[available_space.to_i] = @human
        if game_is_over(board)
          best_move = available_space.to_i
          board[available_space.to_i] = available_space
          return best_move
        else
          board[available_space.to_i] = available_space
        end
      end
    end
  end

  def game_is_over(board)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def tie(board)
    board.all? { |spot| spot == "X" || spot == "O" }
  end
end
