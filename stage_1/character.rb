

class Character < Sprite
 
  def initialize(x, y, image_file, board)
    @image = Image.load(image_file)
    super(x,y,@image)
    # @image.set_color_key([0, 0, 0])　画像透過　必要ないかな
    @board =  board
  end

  def get_y
    self.y
  end

  def get_x
    self.x
  end

  def over_y
     self.y < 0
  end

def get_board
  @board
end

end
