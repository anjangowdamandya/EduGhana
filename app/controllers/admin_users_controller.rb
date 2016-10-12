class AdminUsersController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid? && @user.save!
      flash[:success] = "User created successfully!"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.present? && @user.update_attributes(update_params)
       flash[:success] = "User updated successfully!"
       redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.present? && @user.destroy
      flash[:success] = "User deleted successfully!"
    else
      flash[:error] = "Failed to delete user!"
    end
      redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :user_name, :user_type, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :user_type)
  end

end