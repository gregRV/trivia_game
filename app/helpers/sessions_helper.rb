module SessionsHelper
	def current_user
		(@current_user ||= User.find(user_id)) if (user_id = session[:user_id])
	end
end
