class TermsController < ApplicationController
  #Filter
  before_action :authenticate_user!

	def index
    @terms = TermsSemister.all
  end

  def new
    @term = TermsSemister.new
  end

  def create
    @term = TermsSemister.new(terms_params)
    if @term.valid? && @term.save!
      flash[:success] = "Terms created successfully!"
      redirect_to terms_path
    else
      render 'new'
    end
  end

  def show
    @term = TermsSemister.find_by_id(params[:id])
  end

  def edit
    @term = TermsSemister.find_by_id(params[:id])
  end

  def update
    @term = TermsSemister.find_by_id(params[:id])
    if @term.present? && @term.update_attributes(terms_params)
       flash[:success] = "Terms updated successfully!"
       redirect_to terms_path
    else
      render 'edit'
    end
  end

  def destroy
    @term = TermsSemister.find_by_id(params[:id])
    if @term.present? && @term.destroy
      flash[:success] = "Terms deleted successfully!"
    else
      flash[:error] = "Failed to delete terms!"
    end
      redirect_to terms_path
  end

  private

  def terms_params
    params.require(:terms_semister).permit(:name, :start_date, :end_date, :vacation_date, :reopening_date)
  end

end