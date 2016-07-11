class Light < Sprite
  ACCELERATION = 1

  def initialize(x, y, image = nil)
    image = Image.load("images/heart.png")
    image.set_color_key([0, 0, 0])

    super
    self.z = 8  
    @direction = 1
    @dx = 40
    @dy = 1
    @current_floor = 4
  end

  def update
    @dy += ACCELERATION
    self.y -= @dy
#    vanish if self.y > Window.height
  end
 

  def attackpoint
    -5
  end
end