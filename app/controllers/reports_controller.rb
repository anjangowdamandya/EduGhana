class ReportsController < ApplicationController
   #Filter
  before_action :authenticate_user!

	def index
    @reports = ReportType.all
  end

  def new
    @report = ReportType.new
  end

  def create
    @report = ReportType.new(report_params)
    if @report.valid? && @report.save!
      flash[:success] = "Report created successfully!"
      redirect_to reports_path
    else
      render 'new'
    end
  end

  def show
    @report = ReportType.find_by_id(params[:id])
  end

  def edit
    @report = ReportType.find_by_id(params[:id])
  end

  def update
    @report = ReportType.find_by_id(params[:id])
    if @report.present? && @report.update_attributes(report_params)
       flash[:success] = "Report updated successfully!"
       redirect_to reports_path
    else
      render 'edit'
    end
  end

  def destroy
    @report = ReportType.find_by_id(params[:id])
    if @report.present? && @report.destroy
      flash[:success] = "Report deleted successfully!"
    else
      flash[:error] = "Failed to delete report!"
    end
      redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:name, :description)
  end

end
