class ConversationsController < ApplicationController

	before_filter :authenticate_user!

	layout false, except: :index

	def index
		@users = User.all
		@posts = Post.all.order('created_at DESC')
		@post = current_user.posts.build
	end


	def create
		if Conversation.between(params[:sender_id], params[:recipient_id]).present?
			@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
		else
			@conversation = Conversation.create!(conversation_params)
		end

		render json: { conversation_id: @conversation.id }
	end

	def show
		@conversation = Conversation.find(params[:id])
		@receiver = interlocutor(@conversation)
		@messages = @conversation.messages
		@message = Message.new
	end

	private
		def conversation_params
			params.permit(:sender_id, :recipient_id)
		end

		def interlocutor(conversation)
			current_user == conversation.recipient ? conversation.sender : conversation.recipient
		end

end
