require 'smalrubot'
require_relative 'shot'

class Director

   def initialize
    @board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
    @boss = Boss.new(460,180,"images/boss.png")
    @p_sound = Player_sound.new(50,500,"images/icon_sound.png")
    @p_light = Player_light.new(50,200,"images/icon_light.png")
    @p_distance = Player_distance.new(50,300,"images/distance.png")
    @p_tilt = Player_tilt.new(50,400,"images/icon_tilt.png")
    @p_btn = Player_btn.new(50,100,"images/icon_btn.png")
    @bg_img = Image.load("images/bg_boss.png")
    @prev_button = 0
    @start_time = Time.now
    @prev_tilt = 0
    @prev_mike = 0
    @font = Font.new(32)
    @shots  = []
    @tilts  = []
    @mikes  = []
    @lights = []
  end

    def draw
      Window.draw_font(300, 20, "Life: #{@boss.life}", @font)
      Window.draw_font(500, 20, "Time: #{(Time.now - @start_time).to_i}", @font)
    @p_sound.draw
    @p_light.draw
    @p_distance.draw
    @p_tilt.draw
    @p_btn.draw
    @boss.draw
    Sprite.draw(@shots)
    Sprite.draw(@tilts)
    Sprite.draw(@mikes)
    Sprite.draw(@lights)
    end

  def get_sensors
      @light = @board.analog_read(0)     #明るさの値取得
      @button = @board.digital_read(2)   # ボタンの値取得
      @mike  = @board.analog_read(3)     # 音声の値取得
      @tilt   = @board.digital_read(4)   # 傾きの値取得
  end
    
  def button_pressed?
      @button == 1 && @prev_button == 0
  end

  def tilt_sway?
      @tilt ==   1 && @prev_tilt == 0
  end

  def mike_to?
      @mike >= 400
  end

  def light_on?
      @light >=200
  end
  

  def play
    Window.draw(0, 0, @bg_img)
    get_sensors
    if button_pressed?
      shot = Shot.new( 50,100)
      @shots << shot
    end
    if tilt_sway?
      tilt = Tilt.new( 50,400)
      @tilts << tilt
    end
    if mike_to?
      mike = Mike.new( 50,500)
      @mikes << mike
    end
    if light_on?
      light = Light.new(600-rand(200),500-rand(200)
    end
    Sprite.update(@shots)
    Sprite.check(@shots,@boss)
    Sprite.update(@tilts)
    Sprite.check(@tilts,@boss)
    Sprite.update(@mikes)
    Sprite.check(@mikes,@boss)
    Sprite.update(@lights)
    draw
    
    @prev_button = @button
    @prev_tilt   = @tilt
    @prev_mike  = @mike
    end
end