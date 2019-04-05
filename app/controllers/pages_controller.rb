class PagesController < ApplicationController
	protect_from_forgery
	skip_before_action :verify_authenticity_token

	def index
		@lead = Lead.new
	end
	def gform
		@quote = Quote.new
	end
	def residential
	end

end

