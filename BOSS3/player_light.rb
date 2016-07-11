class Player_light
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load("images/icon_light.png")
    @dx = 1
  end 

  def draw
    Window.draw(@x, @y, @image)
  end


end