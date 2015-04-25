module StaticPagesHelper
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end

  def friend_status(user_id)
    if current_user.friend_list.include?(@user.id)
      return "Friends"
    elsif current_user.friend_pending.include?(user_id)
      return "Friend request sent"
    elsif current_user.friend_list.exclude?(@user.id) && @user.friend_pending.exclude?(current_user.id)
      return link_to 'request friend', request_friend_path(:id => @user.id) unless @user.id == current_user.id
    end
  end

  def check_request(user)
    if user.friend_pending.include?(current_user.id)
      return link_to 'Accept friend request', add_friend_path(:id => @user.id)
    end
  end
end
