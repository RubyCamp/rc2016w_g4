class Ball
	def initialize(x , y)
		@x, @y = x, y
		@image = Image.load("images/ball.png")
	end

	def draw
		Window.draw(@x, @y, @image)
	end

	def move
		if 150 < @@board.analog_read(4)
			@x += 5
		else
			@x -= 5
		end
	end
end