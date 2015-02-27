#coding : utf-8

require 'clide'

slide = Clide::SlideList.new("title")
slide.add(content = <<-CONTENT
	clide example
CONTENT
)
slide.add(content = <<-CONTENT
	サンプルのスライドです
CONTENT
)

Clide::Controller.new(list).show
