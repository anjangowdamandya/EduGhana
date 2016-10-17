class CreateGradings < ActiveRecord::Migration
  def change
    create_table :gradings do |t|
      t.integer :report_id
      t.integer :minimum_marks

      t.timestamps null: false
    end
  end
end
