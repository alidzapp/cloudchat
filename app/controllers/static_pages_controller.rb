class StaticPagesController < ApplicationController

	def index
		@users = User.all
	end

	def profile
		@users = User.all
	end

end
