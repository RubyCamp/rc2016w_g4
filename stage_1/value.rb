require 'dxruby'
require 'Smalrubot'

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
  font = Font.new(64)

Window.loop do
  Window.draw_font(
		   100,
		   100,
		   board.digital_read(2).to_s,
		   #board.analog_read(4).to_s,
		   font
		   )
end
