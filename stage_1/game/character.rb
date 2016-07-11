

class Character
 
  def initialize(x, y, image_file, borad)
    @x, @y = x, y
    @image = Image.load(image_file)
    # @image.set_color_key([0, 0, 0])　画像透過　必要ないかな
    @board =  borad
    @angle = 0
end

  def over_y
     @y<0
  end

  def draw
    Window.draw(@x,@y,@image)
  end

end
