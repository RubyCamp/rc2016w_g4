# coding: utf-8
class Ball
	def initialize(x , y , board, bar)
		@x, @y = x, y
		@bar = bar
		@a, @c = 0, 0
		@angle = 0
		@dx , @dy = 0 ,0 
		@board =  board
		@image = Image.load("images/ball.png")
	end

	def draw
		Window.draw(@x, @y, @image)
	end

	def bar(dx)
		@dx -= dx if (@dx-dx>1)
	end

	def move
          rad = (@bar.get_angle * Math::PI / 180.0)
	  sin = Math.sin(rad)
	  cos = Math.cos(rad)
	  b = @x - @bar.get_x
          return false if b < -25
          m = 0.020
	  @dx += m * 9.8 * cos if @bar.get_angle > 0
	  @dx -= m * 9.8 * cos if @bar.get_angle < 0
	  # @dy = m * 9.8 * sin
	  #if 150 < @board.analog_read(4) # 手で覆われた時
	  @angle += @bar.get_angle
          @x += @dx
          Window.draw_ex(@x,@y,@image,angle: @angle)
	end
end
