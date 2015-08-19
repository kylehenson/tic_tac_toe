class Messages
  def welcome(board)
    puts "Welcome to my Tic Tac Toe game"
    self.print_board(board)
    puts "Please select your spot."
  end

  def print_board(board)
    puts "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n"
  end

  def game_over
    puts "Game over"
  end
end
