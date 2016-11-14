class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @errors = flash[:errors]
  end

  # def create
  #   @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  #
  #   if @user.valid?
  # @user.save
  # redirect_to '/'
  # lse
  # flash[:errors] = @user.errors.full_messages
  # redirect_to '/new'
  # nd
  # end

  #Alternative Method Start

  def create
    @user = User.new(user_params)

    if @user.save
		redirect_to '/'
	else
		flash[:errors] = @user.errors.full_messages
		redirect_to '/new'
	end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  #Alt End

end
