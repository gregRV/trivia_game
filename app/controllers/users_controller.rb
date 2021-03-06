class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :correct_user, 	except: [:new, :create, :show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user, flash: {success: 'Sign up successful!'}
		else
			flash.now[:error] = "Sign up failed."
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	# Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url, notice: "No access for you." unless current_user?(@user)
  end
end
