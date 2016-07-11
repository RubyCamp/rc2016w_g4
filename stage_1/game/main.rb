# -*- coding: utf-8 -*-
require 'dxruby'
require 'Smalrubot'

require_relative'director'
require_relative'character'
require_relative'ball'
require_relative'character_kind'

Window.caption = "RubyCamp2010 Example"

board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)

Window.width   = 270
Window.height  = 600


ba = Director.new(board)
key = Director.new(board)
#bo = Director.new(board)

#key = Image.load('key.png')
#k = Sprite.new(100 ,100, key)
#ball = Image.load('ball.png')
#b = Sprite.new(200, 550 ,ball)

Window.loop do
  #Window.draw_ex(r.x, r.y, rod, angle: angle)
  bo.draw
  bo.move
  #director.play
  break if ba.play
end
