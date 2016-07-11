class Player_tilt
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load("images/icon_tilt.png")
    @dx = 1
  end 

  def draw
    Window.draw(@x, @y, @image)
  end


end