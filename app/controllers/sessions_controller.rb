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

  def destroy
  	# change to log_out if logged_in? later
  	session.delete :user_id
  	flash[:notice] = "Logged out."
  	redirect_to root_url
  end
end
