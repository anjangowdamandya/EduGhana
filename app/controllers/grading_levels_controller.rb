class GradingLevelsController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @grading_levels = GradingLevel.all
  end

  def new
    @grading_level = GradingLevel.new
  end

  def create
    @grading_level = GradingLevel.new(grading_level_params)
    if @grading_level.valid? && @grading_level.save!
      flash[:success] = "Grade level created successfully!"
      redirect_to grading_levels_path
    else
      render 'new'
    end
  end

  def show
    @grading_level = GradingLevel.find_by_id(params[:id])
  end

  def edit
    @grading_level = GradingLevel.find_by_id(params[:id])
  end

  def update
    @grading_level = GradingLevel.find_by_id(params[:id])
    if @grading_level.present? && @grading_level.update_attributes(grading_level_params)
       flash[:success] = "Grade level updated successfully!"
       redirect_to grading_levels_path
    else
      render 'edit'
    end
  end

  def destroy
    @grading_level = GradingLevel.find_by_id(params[:id])
    if @grading_level.present? && @grading_level.destroy
      flash[:success] = "Grade level deleted successfully!"
    else
      flash[:error] = "Failed to delete grade level!"
    end
      redirect_to grading_levels_path
  end

  private

  def grading_level_params
    params.require(:grading_level).permit(:name, :minimum_marks, :maximum_marks, :grade_point, :description)
  end

end