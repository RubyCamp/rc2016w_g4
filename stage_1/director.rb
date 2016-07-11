# coding: utf-8
# -*- coding: utf-8 -*-
class Director
  def initialize(board,w,h)
    @bar = Bar.new(w/2-105, h-100, "images/bar_g.png", board)

    @ball = Ball.new(w/2-15, h-115, "images/ball.png",board,@bar)

    @key = Key.new(w/2-27, 280, "images/key.png", board)

    @bar_right = Bar_gimmick.new(w/2-20, 288, "images/rod_right1.png", board, 15)
    @bar_left = Bar_gimmick.new(-34, 288, "images/rod_left1.png", board, -15)

    @rakuseki = Rakuseki.new(110, 50, "images/bear.png", board, 4,@bar)

    @bear_sound = Sound.new("sound/Drop bear/otita.wav")
    #@key_sound = Sound.new("sound/Get key/doorlock1.wav")

    @bg_img = Image.load("images/background.jpg")

    @bar.obje(@ball, @bar_right, @bar_left)

    @font = Font.new(30)
    @start_time = Time.now
  end

  def play(w,h)
    Window.draw(0, 0, @bg_img)
    Window.draw_font(150, 40, "Time: #{(Time.now - @start_time).to_i}", @font)
    p  "Time: #{(Time.now - @start_time).to_i}"


    @bar.move
    Sprite.draw(@bar)

    if !@ball.move
      if !@bar.get_gimmick
        @bar = Bar.new(w/2-105, h-100, "images/bar_g.png", @bar.get_board)
        @ball = Ball.new(w/2-15, h-115, "images/ball.png",@bar.get_board,@bar)
        @bar.obje(@ball, @bar_right, @bar_left)
      elsif
        @bar = Bar.new(w/2-105, 250, "images/bar_g.png", @bar.get_board)
        @ball = Ball.new(w/2-15, 235, "images/ball.png", @bar.get_board,@bar)
        @bar.obje(@ball, @bar_right, @bar_left)
      end
    end

    Sprite.draw(@ball)

    move = @key.move
    on = @bar.get_board.digital_read(2)
    @bar_right.move if move&&on==1
    @bar_left.move if move&&on==1
    Sprite.draw(@bar_right)
    Sprite.draw(@bar_left) 

    @rakuseki.move if @bar_right.x > (w/2)+60
    Sprite.draw(@rakuseki) if @bar_right.x > (w/2)+60

    Sprite.draw(@key) if !@key.move && @bar_right.x < w-10
   @rakuseki.move if @bar_right.x > ( w / 2 ) + 60

    Sprite.draw(@rakuseki) if @bar_right.x > ( w / 2 ) + 60    

    Sprite.draw(@key) if !@key.move && @bar_right.x<w-10

    #Sprite.clean(@rakuseki)     # 落石削除(声を出したとき)

    if @rakuseki.hit            # 落石物が当たったら
      @bear_sound.stop
       @bear_sound.play	
      @bar.y += 50
      @rakuseki = Rakuseki.new(rand(100) + 130, 0, @rakuseki.get_chars[@rakuseki.get_rand], @rakuseki.get_board, 4 ,@bar)
      @bar.y = 500 if @bar.y>500
    end
    if @rakuseki.voice < 0
       @rakuseki = Rakuseki.new(rand(100) + 130, 0, @rakuseki.get_chars[@rakuseki.get_rand], @rakuseki.get_board, 4 ,@bar)
    end

    #@ball.draw
    #p @bar.get_y
    @bar.over_y   #　固定

  end

end
