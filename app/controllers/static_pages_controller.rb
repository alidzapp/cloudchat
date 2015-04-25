class StaticPagesController < ApplicationController


	def index
		@users = User.all
	end

	def profile
		@users = User.all
		@user = User.find(params[:id])
	end

	def request_friend
		@user = User.find(params[:id])
		current_user.friend_pending << @user.id
		current_user.save
		redirect_to profile_path(:id => @user.id)
	end

	def add_friend
		@user = User.find(params[:id])
		current_user.friend_list << @user.id
		@user.friend_list << current_user.id
		@user.friend_pending.delete(current_user.id)
		current_user.save
		@user.save
		redirect_to profile_path(:id => @user.id)
	end

	private
		def notification_params
			params.require(:notification).permit(:content)
		end
end
