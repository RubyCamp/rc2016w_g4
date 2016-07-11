# -*- coding: utf-8 -*-
require 'dxruby'
require 'Smalrubot'

require_relative'director'
require_relative'character'
require_relative'character_kind'

Window.caption = "RubyCamp2010 Example"

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)

window_w = 400
window_h = 600

Window.width   = window_w
Window.height  = window_h


director = Director.new(board,window_w,window_h)

font = Font.new(32)

Window.loop do
 # Window.draw_font(500, 600, "Time: #{(Time.now - @start_time).to_i}", @font)
  break if director.play(window_w,window_h)
end


