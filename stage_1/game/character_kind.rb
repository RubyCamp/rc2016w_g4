class Bar < Character

  def initialize(x, y, image_file, borad, dx, dy ,dangle)
    super(x, y, image_file, borad)
    @dx, @dy, @dangle = dx, dy ,dangle
  end

  def move
    if 150 < @board.analog_read(4)
      @y += @dy
      sleep(0.05)
      @angle += @dangle
    else 
      @angle -= 0.5
    end
  end

end
