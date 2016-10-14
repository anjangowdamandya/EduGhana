class SubjectsController < ApplicationController
   #Filter
  before_action :authenticate_user!

	def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.valid? && @subject.save!
      flash[:success] = "Subject created successfully!"
      redirect_to subjects_path
    else
      render 'new'
    end
  end

  def show
    @subject = Subject.find_by_id(params[:id])
  end

  def edit
    @subject = Subject.find_by_id(params[:id])
  end

  def assign_subject
    @subject = Subject.find_by_id(params[:id])
    @users = User.where("user_type=?", "Employee")
  end

  def update
    @subject = Subject.find_by_id(params[:id])
    if @subject.present? && @subject.update_attributes(subject_params)
       flash[:success] = "Subject updated successfully!"
       redirect_to subjects_path
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find_by_id(params[:id])
    if @subject.present? && @subject.destroy
      flash[:success] = "Subject deleted successfully!"
    else
      flash[:error] = "Failed to delete subject!"
    end
      redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :subject_type, :batch_id, :employee_id)
  end

end
