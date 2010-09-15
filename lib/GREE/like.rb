#!/usr/bin/env ruby
require 'cgi'

module GREE; end
class GREE::Like
	def initialize(config)
		@config = config
	end
	
	def meta
		<<-"META"
<meta property="og:title" content="#{@config[:title]}" />
<meta property="og:url" content="#{@config[:url]}" />
<meta property="og:image" content="#{@config[:image]}" />
<meta property="og:type" content="#{@config[:website]}" />
META
	end
	
	def button_like(url)
		<<-"BUTTON"
<iframe src="http://share.gree.jp/share?url=#{CGI.escape(url)}&amp;type=0&amp;height=20" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" style="border:none; overflow:hidden; width:100px; height:20px;" allowTransparency="true"></iframe>
BUTTON
	end
end


if $0 == __FILE__ then
	config = {
		:title => 'GREE',
		:url   => 'http://gree.jp/',
		:image => 'http://gree.jp/images/logo.jpg',
		:type  => 'website',
	}
	like = GREE::Like.new(config)
	puts like.meta
	puts like.button_like('http://bloghackers.net/~naoya/sandbox/like.html')
end

