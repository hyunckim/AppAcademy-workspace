require_relative 'board'

class Minesweeper

  def initialize
    @board = Board.new
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new
end
