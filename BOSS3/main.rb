require 'dxruby'

require 'smalrubot'
require_relative './director'
require_relative 'boss'
require_relative 'character'
require_relative 'player_light'
require_relative 'player_sound'
require_relative 'player_btn'
require_relative 'player_distance'
require_relative 'player_tilt'
require_relative 'shot'
require_relative 'tilt'
require_relative 'mike'
require_relative 'light'

Window.caption = "RubyCamp2016"
Window.width  = 800
Window.height = 600

director = Director.new

Window.loop do
	break if Input.keyPush?(K_ESCAPE)

	director.play
end