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
      flash[:success] = "Exam created successfully!"
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
    if @exam.present? && @exam.update_attributes(exam_params)
       flash[:success] = "Exam updated successfully!"
       redirect_to exams_path
    else
      render 'edit'
    end
  end

  def destroy
    @exam = Exam.find_by_id(params[:id])
    if @exam.present? && @exam.destroy
      flash[:success] = "Exam deleted successfully!"
    else
      flash[:error] = "Failed to delete exam!"
    end
      redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :minimum_marks, :maximum_marks, :weightage)
  end

end