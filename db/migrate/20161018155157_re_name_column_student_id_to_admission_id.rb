class ReNameColumnStudentIdToAdmissionId < ActiveRecord::Migration
  def change
    rename_column :admissions, :student_id, :admission_id
  end
end
