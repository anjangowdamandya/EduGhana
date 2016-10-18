class AddUserIdInSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :employee_id, :integer
  end
end
