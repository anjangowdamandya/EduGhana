class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.valid? && @school.save!
      flash[:success] = "School created successfully!"
      redirect_to schools_path
    else
      render 'new'
    end
  end

  def show
    @school = School.find_by_id(params[:id])
  end

  def edit
    @school = School.find_by_id(params[:id])
  end

  def update
    @school = School.find_by_id(params[:id])
    if @school.present? && @school.update_attributes(school_params)
       flash[:success] = "School updated successfully!"
       redirect_to schools_path
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find_by_id(params[:id])
    if @school.present? && @school.destroy
      flash[:success] = "School deleted successfully!"
    else
      flash[:error] = "Failed to delete school!"
    end
      redirect_to schools_path
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :telephone, :email, :city, :region, :currency_type, :logo, :country)
  end

end
