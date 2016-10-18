class BatchesController < ApplicationController
   #Filter
  before_action :authenticate_user!
  
	def index
    @batches = Batch.all
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.valid? && @batch.save!
      flash[:success] = "Batch created successfully!"
      redirect_to batches_path
    else
      render 'new'
    end
  end

  def show
    @batch = Batch.find_by_id(params[:id])
  end

  def edit
    @batch = Batch.find_by_id(params[:id])
  end

  def update
    @batch = Batch.find_by_id(params[:id])
    if @batch.present? && @batch.update_attributes(batch_params)
       flash[:success] = "Batch updated successfully!"
       redirect_to batches_path
    else
      render 'edit'
    end
  end

  def destroy
    @batch = Batch.find_by_id(params[:id])
    if @batch.present? && @batch.destroy
      flash[:success] = "Batch deleted successfully!"
    else
      flash[:error] = "Failed to delete batch!"
    end
      redirect_to batches_path
  end

  private

  def batch_params
    params.require(:batch).permit(:name, :code, :start_date, :end_date, :report_id)
  end

end