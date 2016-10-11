class ExamsController < ApplicationController
   #Filter
  before_action :authenticate_user!

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.valid? && @exam.save!
      flash[:success] = "Batch created successfully!"
      redirect_to exams_path
    else
      render 'new'
    end
  end

  def show
    @exam = Exam.find_by_id(params[:id])
  end

  def edit
    @exam = Exam.find_by_id(params[:id])
  end

  def update
    @exam = Exam.find_by_id(params[:id])
    if @exam.present? && @exam.update_attributes(batch_params)
       flash[:success] = "Batch updated successfully!"
       redirect_to exams_path
    else
      render 'edit'
    end
  end

  def destroy
    @exam = Exam.find_by_id(params[:id])
    if @exam.present? && @exam.destroy
      flash[:success] = "Batch deleted successfully!"
    else
      flash[:error] = "Failed to delete batch!"
    end
      redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :minimu_marks, :maximum_marks, :weightage)
  end

end