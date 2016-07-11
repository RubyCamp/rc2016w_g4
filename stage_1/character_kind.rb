 # coding: cp932
class Bar < Character

  def initialize(x, y, image_file, board)
    super(x, y, image_file,board)
    @mem = @board.digital_read(6) #傾きD6
    @dy, @angle,@mem_avarage = -6, 3, 150
    @mem_slope = @board.analog_read(6)
    self.angle = 0
    @gimmick = false
  end

  def obje(ball, bar_right, bar_left)
    @ball, @bar_right, @bar_left = ball, bar_right, bar_left
  end
  
  def move
    @gimmick = true if self.y < 260
    angle = @board.analog_read(4)
    @dy , @angle = 0, 0
    if 400 <= angle
      @dy = -4
      @angle = 0.3
    elsif 300 <= angle && angle < 400
      @dy = -2
      @angle = 0.3
    elsif 200 <= angle && angle < 300
      @dy = 1
      @angle = -0.3
    elsif 100 <= angle && angle < 200
      @dy = 2
      @angle = -0.3
    end
    
    if(Sprite.check(self, @bar_left)||Sprite.check(self, @bar_right))
      @dy = 0 if @dy < 0
      @angle = 0 if self.angle * @angle 
    end
=begin
    slope = @board.digital_read(6)

    if @mem_slope != slope
      self.angle -= 1 if self.angle > 1
      self.angle += 1 if self.angle < -1
      @mem_slope = slope
    end
=end
    self.y += @dy
    self.angle += @angle

    if self.y > 550
      self.y = 550
    end
    
    self.angle = 30 if self.angle > 30
    self.angle = -30 if self.angle < -30
    
  end

  

  def get_gimmick
    @gimmick
  end 

end

class Ball < Character

  def initialize(x , y , image_file, board, bar)
    super(x,y,image_file,board)
    @bar = bar
    @a, @c = 0, 0
    self.angle = 0
    @dx, @dy = 0 ,0 
  end

  def move
    rad = ((90 - @bar.angle) * Math::PI / 180.0)
    sin = Math.sin(rad)
    cos = Math.cos(rad)
    b = self.x - @bar.x
    m = 10
    @dx = m * 9.8 * cos
    self.angle += @bar.angle
    self.x += @dx
    self.y = -30
    while self.y < 700
      self.y += 1
      break if Sprite.check(self,@bar)
    end
    self.y += 5
    self.y < 705
  end
end

class Key < Character

 def initialize(x, y, image_file, board)
    super(x, y, image_file, board)
  end 

  def move
    @board.analog_read(0) < 350
  end

end

class Bar_gimmick< Character

  def initialize(x, y, image_file, board, dx)
    super(x, y, image_file, board)
    @dx = dx
  end

  def move
     self.x += @dx
  end

end


class Rakuseki < Character
  
  def initialize(x, y, image_file, board, dy, bar)
    @chars = ["images/bear.png","images/meteorite.png","images/meteorite2.png"]
    @rand = rand(3)
    super(x, y, image_file, board)
    @dy = dy
    @bar = bar
    @limit = 3
    @mem = @board.digital_read(6)
  end

  def move  # 声で消す
    self.y += @dy
    self.y = -100 if @bar.get_y < 250
      #self.vanish if @board.digital_read(7) == 1
      #p @board.digital_read(7)
  end

  def hit
    Sprite.check(self, @bar)
  end
  
  def voice
    angle = @board.digital_read(6)
    if angle != @mem
      @limit -= 1
      @mem = angle
    end
    @limit
  end

  def get_rand
    @rand
  end

  def get_chars
    @chars
  end
end
