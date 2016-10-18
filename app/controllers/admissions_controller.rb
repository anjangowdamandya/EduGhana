class AdmissionsController < ApplicationController
  def index
    @admissions = Admission.all
  end

  def new
    @admission = Admission.new
  end

  def create
    @admission = Admission.new(admission_params)
    if @admission.save
      flash[:success] = "Admission created successfully!"
      redirect_to admissions_path
    else
      flash[:error] = "Failed to create Admission"
      redirect_to admissions_path
    end
  end

  def fetch_users
    @admission = Admission.new
    @users = User.where('user_type = ?', params[:user_type])
  end

  private

  def admission_params
    params.require(:admission).permit(:student_id, :gender, :street, :city, :mobile, :email, :id_number, :id_type, :admission_date, :batch_id, :user_id)
  end
end
