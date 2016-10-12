class EmployeesController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @employees = User.where("user_type = ?", "Employee").all
  end

  def new
    @employee = User.new
  end

  def create
    @employee = User.new(employee_params)
    @employee.user_type="Employee"
    if @employee.valid? && @employee.save!
      flash[:success] = "Employee created successfully!"
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def show
    @employee = User.find_by_id(params[:id])
  end

  def edit
    @employee = User.find_by_id(params[:id])
  end

  def update
    @employee = User.find_by_id(params[:id])
    if @employee.present? && @employee.update_attributes(update_params)
       flash[:success] = "Employee updated successfully!"
       redirect_to employees_path
    else
      render 'edit'
    end
  end

  def destroy
    @employee = User.find_by_id(params[:id])
    if @employee.present? && @employee.destroy
      flash[:success] = "Employee deleted successfully!"
    else
      flash[:error] = "Failed to delete employee!"
    end
      redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :user_name, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name)
  end

end