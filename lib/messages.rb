class Messages
  def welcome(board)
    puts "Welcome to my Tic Tac Toe game!"
    self.print_board(board)
    puts "You are 'O' and the computer is 'X'. Please select your spot."
  end

  def print_turn_identifier
    print "> "
  end

  def print_board(board)
    puts "|_#{board[0]}_|_#{board[1]}_|_#{board[2]}_|\n|_#{board[3]}_|_#{board[4]}_|_#{board[5]}_|\n|_#{board[6]}_|_#{board[7]}_|_#{board[8]}_|\n"
  end

  def game_over
    puts "Game over!"
  end

  def game_tie
    puts "It's a tie!"
  end

  def bad_input
    puts "Invalid input. Please try again."
  end

  def print_computer_spot(computer_spot)
    puts "The computer chose spot #{computer_spot}."
  end
end
