class TermsSemisterController < ApplicationController

	def index
    @terms_semisters = TermsSemister.all
  end

  def new
    @terms_semister = TermsSemister.new
  end

  def create
    @terms_semister = TermsSemister.new(terms_params)
    if @terms_semister.valid? && @terms_semister.save!
      flash[:success] = "Terms/semister created successfully!"
      redirect_to terms_semister_index_path
    else
      render 'new'
    end
  end

  def show
    @terms_semister = TermsSemister.find_by_id(params[:id])
  end

  def edit
    @terms_semister = TermsSemister.find_by_id(params[:id])
  end

  def update
    @terms_semister = TermsSemister.find_by_id(params[:id])
    if @terms_semister.present? && @terms_semister.update_attributes(terms_params)
       flash[:success] = "Terms/semister updated successfully!"
       redirect_to terms_semister_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @terms_semister = TermsSemister.find_by_id(params[:id])
    if @terms_semister.present? && @terms_semister.destroy
      flash[:success] = "Terms/semister deleted successfully!"
    else
      flash[:error] = "Failed to delete terms/semister!"
    end
      redirect_to terms_semister_index_path
  end

  private

  def terms_params
    params.require(:terms_semister).permit(:name, :start_date, :end_date, :vacation_date, :reopening_date)
  end

end