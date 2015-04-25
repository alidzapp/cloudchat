class StaticPagesController < ApplicationController

	def index
		@users = User.all
	end

	def profile
		@users = User.all
		@user = User.find(params[:id])
	end

end
