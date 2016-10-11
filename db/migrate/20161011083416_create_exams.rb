class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :minimum_marks
      t.integer :maximum_marks
      t.integer :weightage

      t.timestamps null: false
    end
  end
end
