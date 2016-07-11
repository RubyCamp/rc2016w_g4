class Boss < Sprite
  attr_reader :life

  def initialize(x, y, image = nil)
    @x, @y = x, y
    @image = Image.load("images/boss.png")
    image = @image
    @image.set_color_key([255, 255, 255])
    @life = 10000
    @brightness = 255
    @dx = 1
    super
  end 

  def draw
    Window.draw(@x, @y, @image)
  end
  
  def hit(obj)
    if 
      @life -= obj.attackpoint
      if @life == 0
        puts "game clear!!!!!!!!!"
        exit
      end
    end
  end

end