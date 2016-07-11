class Shot < Sprite
  ACCELERATION = 1

  def initialize(x, y, image = nil)
    image = Image.load("images/misairu.png")
    image.set_color_key([0, 0, 0])

    super
    self.z = 8  # ninjinの次に前面に表示
    @direction = 1
    @dx = 30
    @dy = 1
    @current_floor = 4
  end

  def update
    @dy += ACCELERATION
    self.x += @direction * @dx
    self.y += @dy
#    vanish if self.y > Window.height
  end
 
  def hit(obj)
    vanish
  end
 
  def shot(obj)
    vanish
  end

  def attackpoint
    2
  end
end
