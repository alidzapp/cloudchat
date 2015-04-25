module ApplicationHelper


	def notification_check
		if current_user.notifications.all.nil?
			return true
		else
			return false
		end
	end

end
