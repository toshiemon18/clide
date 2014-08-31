# -*- coding : utf-8 -*-

module Clide
	class SlideList
		def initialize
			@slide_list = []
			@total_page = 0
		end

		def add(slide_object)
			@slide_list << slide_object
			@total_page += 1
		end

		def total_page
			@total_page
		end
	end
end
