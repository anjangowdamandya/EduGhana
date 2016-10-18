class GradingsController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @gradings = Grading.all
  end

  def new
    @grading = Grading.new
  end

  def create
    @grading = Grading.new(grading_params)
    if @grading.valid? && @grading.save!
      flash[:success] = "Grade created successfully!"
      redirect_to gradings_path
    else
      render 'new'
    end
  end

  def show
    @grading_level = Grading.find_by_id(params[:id])
  end

  def edit
    @grading_level = Grading.find_by_id(params[:id])
  end

  def update
    @grading_level = Grading.find_by_id(params[:id])
    if @grading.present? && @grading.update_attributes(grading_params)
       flash[:success] = "Grade level updated successfully!"
       redirect_to gradings_path
    else
      render 'edit'
    end
  end

  def destroy
    @grading = Grading.find_by_id(params[:id])
    if @grading.present? && @grading.destroy
      flash[:success] = "Grade deleted successfully!"
    else
      flash[:error] = "Failed to delete grade!"
    end
      redirect_to gradings_path
  end

  private

  def grading_params
    params.require(:grading).permit(:report_id, :minimum_marks)
  end

end