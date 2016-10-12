class StudentsController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @students = User.where("user_type = ?", "Student").all
  end

  def new
    @student = User.new
  end

  def create
    @student = User.new(student_params)
    @student.user_type="Student"
    if @student.valid? && @student.save!
      flash[:success] = "Student created successfully!"
      redirect_to students_path
    else
      render 'new'
    end
  end

  def show
    @student = User.find_by_id(params[:id])
  end

  def edit
    @student = User.find_by_id(params[:id])
  end

  def update
    binding.pry
    @student = User.find_by_id(params[:id])
    if @student.present? && @student.update_attributes(update_params)
       flash[:success] = "Student updated successfully!"
       redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    @student = User.find_by_id(params[:id])
    if @student.present? && @student.destroy
      flash[:success] = "Student deleted successfully!"
    else
      flash[:error] = "Failed to delete student!"
    end
      redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :user_name, :user_type, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name)
  end

end