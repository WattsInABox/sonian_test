module GridHelper
  protected

  def get_max(current_max, value)
    [current_max, value].max
  end

  def inbounds?(grid_size, x, y)
    x >= 0 && y >= 0 && x < grid_size && y < grid_size
  end
end