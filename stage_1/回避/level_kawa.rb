require 'dxruby'
require 'Smalrubot'

Window.caption = "RubyCamp2010 Example"

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)


Window.width   = 414
Window.height  = 600

rod = Image.load('rod.png')
r = Sprite.new(80 ,600 , rod)
key = Image.load('key.png')
k = Sprite.new(100 ,100, key)
ball = Image.load('ball.png')
b = Sprite.new(200, 550 ,ball)



angle = 0

Window.loop do
	Window.draw_ex(r.x, r.y, rod, angle: angle)
	#b.draw
	break if r.y < 0
	if 150 < board.analog_read(4)
		r.y -= 6
		sleep(0.05)
		angle += 1
		b.x += 4
	else
		#r.draw
		angle -= 0.5        #棒を左回転させる
		b.x -= 1
	end
end
