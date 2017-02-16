require_relative 'tile'
require 'byebug'

class Board

  def initialize(size = 9)
    @size = size
    @grid = Array.new(@size) { Array.new(@size) }
    populate
  end

  def populate
    (0...@size).each do |row|
      (0...@size).each do |col|
        @grid[row, col] = Tile.new
      end
    end
  end

  def place_bombs
    @size.times do


      
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def reveal(pos)

  end

end
