# -*- coding : utf-8 -*-

$:.unshift File.dirname(__FILE__)
require 'clide'

module Clide
	class SlideList
		def initialize(title)
			@slide_list = []
			@total_page = 0
			@title = title
		end

		def add(content)
			@slide_list << Clide::Slide.new(content)
			@total_page += 1
		end

		def total_page
			@total_page
		end

		def title
			@title
		end

		def slide_list
			@slide_list	
		end
	end
end
