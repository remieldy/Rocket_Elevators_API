class PagesController < ApplicationController

	def index
		@lead = Lead.new
	end
	def gform
		@quote = Quote.new
	end
	def residential
	end
end

