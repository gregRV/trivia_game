class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		# refactor to use log_in(user) method later
  		session[:user_id] = user.id
  		flash[:success] = "Logged In"
  		redirect_to user
  	else
  		flash.now[:error] = 'Failed to log in.'
  		render 'new'
  	end
  end
end
