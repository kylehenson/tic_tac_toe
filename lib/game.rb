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
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @computer
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @human
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(board)
    row1 = [board[0], board[1], board[2]]
    row2 = [board[3], board[4], board[5]]
    row3 = [board[6], board[7], board[8]]
    column1 = [board[0], board[3], board[6]]
    column2 = [board[1], board[4], board[7]]
    column3 = [board[2], board[5], board[8]]
    diagonal1 = [board[0], board[4], board[8]]
    diagonal2 = [board[2], board[4], board[6]]

    row1.uniq.length == 1 ||
    row2.uniq.length == 1 ||
    row3.uniq.length == 1 ||
    column1.uniq.length == 1 ||
    column2.uniq.length == 1 ||
    column3.uniq.length == 1 ||
    diagonal1.uniq.length == 1 ||
    diagonal2.uniq.length == 1
  end

  def tie(board)
    board.all? { |spot| spot == "X" || spot == "O" }
  end

end
