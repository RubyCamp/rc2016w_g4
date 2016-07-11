class Mike < Sprite
  ACCELERATION = 1

  def initialize(x, y, image = nil)
    image = Image.load("images/shot_hadouken.png")
    image.set_color_key([0, 0, 0])
    self.z = 8  
    @direction = 1
    @dx = 30
    @dy = 1
    @current_floor = 4 
    super
  end

  def update
    @dy += ACCELERATION
    self.x += @direction * @dx
    self.y -= @dy
#    vanish if self.y > Window.height
  end
 
  def hit(obj)
    vanish
  end
 
  def shot(obj)
    vanish
  end
  def attackpoint
    10
  end
end