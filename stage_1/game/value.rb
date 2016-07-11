require 'dxruby'

board = Smalrubot::Board.new(Smalrubot)
  font = Font.new(64)

Window.loop do
  Window.draw_font(
		   100,
		   100,
		   borad.analog_read(4).to_s,
		   font
		   )
end
