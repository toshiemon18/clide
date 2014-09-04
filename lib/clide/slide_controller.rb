# -*- coding : utf-8 -*-

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'curses'

module Clide
	class Controller
		def initialize(slide_list)
			@title = slide_list.title
			@slides = slide_list.slide_list
			@current_page = 0
			@total_page = @slides.length
		end

		# 必ず最初に呼ばれる
		def screen_init
			Curses.init_screen
			Curses.stdscr.keypad(true)
			Curses.curs_set(0)
		end

		# 最後のスライドが表示されたら呼び出される
		def screen_close
			Curses.close_screen
		end

		# 次のスライドに移動するか前に戻るかの制御メソッド
		def stand
			if Curses.getch == 10 || Curses.getch == Curses::Key::RIGHT then
				self.next
			elsif Curses.getch == Curses::Key::LEFT || Curses.getch == 8 then
				self.prev
			end
		end

		def slide_setup
			slide = @slides[@current_page]
			line = 0
			start_column = slide.start_column
			start_line = slide.start_line
			slide.content.each do |str|
				Curses.setpos(start_line + line , start_column)
				Curses.addstr(str)
				line+=1
			end
			Curses.setpos(25, Curses.cols / 2 - (@current_page + 1).to_s.length / 2)
			Curses.addstr("[#{@current_page + 1} / #{@total_page}]")
			Curses.setpos(0, Curses.cols / 2 - @title.length / 2)
			Curses.addstr("#{@title}")
		end

		# 次のスライドを準備する
		def next
			if @current_page != @slides.length then 
				Curses.clear
				@current_page+=1
			end
		end

		# 前のスライドを準備する
		def prev
			if @current_page > 0 then
				Curses.clear
				@current_page-=1
			end
		end

		# スライドを再生する
		def show
			self.screen_init
			begin 
				loop do 
					self.slide_setup
					self.stand
					if @current_page == @total_page then
						break
					end
				end
			ensure
				self.screen_close
			end
		end
	end
end
