class Character
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load("images/unk.png")
    @image.set_color_key([255, 255, 255])
    @dx = 1
  end 

  def draw
    Window.draw(@x, @y, @image)
  end


end