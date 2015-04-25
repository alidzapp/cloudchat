class PostsController < ApplicationController

	before_action :authenticate_user!

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to root_path
			@notification = current_user.notifications.build
			@notification.content = "new post"
			current_user.save
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end


	private
		def post_params
			params.require(:post).permit(:content)
		end

end
