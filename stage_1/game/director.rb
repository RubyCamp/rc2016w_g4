# -*- coding: utf-8 -*-
class Director
  def initialize(borad)
    @bar = Bar.new(35, 500, "images/bar_g.png", borad, 0, -6, 1)
    @ball = Ball.new(35, 500)
    @key = Character.new(150, 300, "images/key.png", board, 0, 0, 0)
    @bg_img = Image.load("images/background.jpg")
  end

  def play
    Window.draw(0, 0, @bg_img)

    @bar.move
    @bar.draw
    @barh.over_y

    @ball.draw
    @ball.move

    
  end

  def draw
    #@ball.draw
  end

  def move
  end
end
