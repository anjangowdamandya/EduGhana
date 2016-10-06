class CreateGradingLevels < ActiveRecord::Migration
  def change
    create_table :grading_levels do |t|
      t.string :name
      t.integer :minimum_marks
      t.integer :maximum_marks
      t.string :grade_point
      t.text :description

      t.timestamps null: false
    end
  end
end
