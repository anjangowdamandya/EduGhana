class AdmissionsController < ApplicationController
  def index
    @admissions = Admission.all
  end

  def new
    @admission = Admission.new
  end

  def create
    @admission = Admission.new(admission_params)
    admission_id = @admission.user.user_type == 'Student' ? 'Student' : 'Other'
    if @admission.save
      @admission.admission_id = "#{admission_id} #{@admission.id}"
      @admission.save
      flash[:success] = "Admission created successfully!"
      redirect_to admissions_path
    else
      flash[:error] = "Failed to create Admission"
      redirect_to admissions_path
    end
  end

  def edit
    @admission = Admission.find_by_id(params[:id])
    @users = User.where('id = ?', @admission.user_id)
  end

  def update
    @admission = Admission.find_by_id(params[:id])
    if @admission.present? && @admission.update_attributes(admission_params)
       flash[:success] = "Admission updated successfully!"
       redirect_to admissions_path
    else
      render 'edit'
    end
  end

  def destroy
    @admission = Admission.find(params[:id])
    if @admission.present? && @admission.destroy
      flash[:success] = "Admission deleted successfully!"
    else
      flash[:error] = "Failed to delete admission!"
    end
      redirect_to admissions_path
  end

  def fetch_users
    @admission = Admission.new
    if params[:user_type] == 'Student'
      @users = User.where('user_type = ?', params[:user_type]).where('id NOT IN (SELECT DISTINCT(user_id) FROM admissions)')
    else
      @users = User.where.not('user_type = ?', 'Student').where('id NOT IN (SELECT DISTINCT(user_id) FROM admissions)')
    end
  end

  private

  def admission_params
    params.require(:admission).permit(:admission_id, :gender, :street, :city, :mobile, :email, :id_number, :id_type, :admission_date, :batch_id, :user_id)
  end
end
