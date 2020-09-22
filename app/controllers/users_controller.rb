class UsersController < ApplicationController
  def new
  end

  def create
    # user = User.new(user_params)
    if  user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/singnup'  # need? since no restrick from access
    end
  end

  # private
  # 	def user_params
  # 		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  # 	end
end
