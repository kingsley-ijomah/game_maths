require 'rubygems'
require 'gosu'
Dir["./lib/*.rb"].each {|file| require file }

class Ball
	attr_accessor :x, :y, :w, :h

	def initialize(window, x, y)
		@x = x
		@y = y
		@w = 140
		@h = 140
		@image = Gosu::Image.new(window, './img/ball.png', false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end
end

class GameWindow < Gosu::Window
	attr_accessor :width, :height

	def initialize
		@width = 1600
		@height = 600

		@vx = 0
		@spring = 0.1
		@targetX = 700

		super @width, @height, false
		self.caption = 'Maths Game'
		@ball = Ball.new(self, 1, 200)
	end

	def update
		dx = @targetX - @ball.x
		ax = dx * @spring
		@vx += ax
		@ball.x += @vx
	end

	def draw
		@ball.draw
	end
end

window = GameWindow.new
window.show