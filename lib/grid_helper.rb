module GridHelper
  protected

  def get_max(current_max, value)
    [current_max, value].max
  end

  # This method can be used to get the product of a succession of numbers in a grid. The 
  # method returns index offsets up to the given n numbers (0..3 for an n value of 4). The
  # calling block is expected to return values in the grid that correspond to the offset.
  # 
  # @example If you want to find the product of four numbers going down in a grid...
  #   get_product(4) do |m|
  #     grid[x + m][y]
  #   end
  # 
  # @param [Integer] n How many numbers to multiply together to determine the product
  # @yield [Integer] m The index offset for the grid, given how many numbers are multiplied together. For
  #   example, if n is 4, m will be 0..3
  # @yieldreturn [Numeric] a number in the grid that corresponds to the position offset #get_product returns
  # @return [Numeric] product of all numbers
  def get_product(n, &block)
    (0..(n - 1)).inject(1) do |product, m|
      # multiply the current product with the next number in the grid
      product * block.call(m)
    end
  end

  def inbounds?(grid_size, x, y)
    x >= 0 && y >= 0 && x < grid_size && y < grid_size
  end
end