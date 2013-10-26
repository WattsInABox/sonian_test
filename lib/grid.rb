require_relative 'grid_helper'

class Grid
  include GridHelper

  attr_accessor :grid

  def initialize(_grid)
    self.grid = _grid
  end

  # Scans the grid top-down, left-to-right to find the maximum product of any N numbers
  # in the grid
  # 
  # @param [Integer] n How many numbers to multiply together to determine the max product
  # @return [Numeric] the maximum product of any numbers in the grid
  def max_product(n)
    maximum = 0
    # for now, only support square grids, cause... who cares?
    grid_size = grid.size

    # @todo make this double loop a method and yield values
    grid.each_with_index do |row, x|
      row.each_with_index do |value, y|
        # scan to the right, down, and all down diagonal directions. 
        # This will prevent over-scanning, I think.

        # scan to the right
        maximum = get_max(maximum, row[y..(y + n - 1)].inject(1, :*))  unless y + n >= grid_size
        
        # scan down
        # make sure that the last number going down is inbounds
        if inbounds?(grid_size, x + n - 1, y)
          down_product = get_product(n) do |m|
            grid[x + m][y]
          end

          maximum = get_max(maximum, down_product)
        end

        # scan down diagonal-left
        if inbounds?(grid_size, x + n - 1, y - n - 1)
          diagonal_down_left_product = get_product(n) do |m|
            grid[x + m][y - m]
          end

          maximum = get_max(maximum, diagonal_down_left_product)
        end
        
        # scan down diagonal-right
        if inbounds?(grid_size, x + n - 1, y + n - 1)
          diagonal_down_right_product = get_product(n) do |m|
            grid[x + m][y + m]
          end

          maximum = get_max(maximum, diagonal_down_right_product)
        end

      end # each column in row
    end # each row

    maximum
  end

end
