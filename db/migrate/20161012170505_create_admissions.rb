class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.string :student_id
      t.string :gender
      t.text :street
      t.string :city
      t.string :mobile
      t.string :email
      t.string :id_number
      t.string :id_type
      t.string :admission_date
      t.references :batch, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :admissions, :batches
    add_foreign_key :admissions, :users
  end
end
