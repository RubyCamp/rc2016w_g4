require 'dxruby'

Window.width = 400
Window.height= 600
font = Font.new(32)
Window.loop do
	Window.draw_font(
	 		100,
			100,
			"x: #{Input.mouse_x}",
			font
			)
	Window.draw_font(100,150,"y : #{Input.mouse_y}",font)
end
