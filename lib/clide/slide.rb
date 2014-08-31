# -*- coding: utf-8 -*-

$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'curses'

module Clide
	class Slide

		attr_accessor :title

		def initialize(content="", title="")
			slide_text = content
			text_line_num = slide_text.count("\n")
			@lines = Array.new(text_line_num, "")
			slide_text.each_line { |text| @lines << text.strip! }
			@title = title
		end

		# スライド本文をセットする
		# ヒアドキュメントで代入してもらう
		def content=(slide_text)
			text_line_num = slide_text.count("\n")
			@lines = Array.new(text_line_num, "")
			slide_text.each_line { |text| @lines << text.strip! }
		end

		# スライド本文を返す
		def content
			@lines
		end

		# スライドのタイトルを返す
		def title
			@title
		end

		# 本文のはじめの行のスタート位置
		def start_line
			Curses.lines / 2 - @lines.length / 2
		end

		# 本文のスタート位置
		# スタート位置は文字列としての長さが一番大きい行を基準にする
		def start_column
			max_length = 0
			@lines.each do |str|
				max_length = str.length if max_length < str.length
			end
			return Curses.cols / 2 - max_length / 2
		end
	end
end
