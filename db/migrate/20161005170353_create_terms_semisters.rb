class CreateTermsSemisters < ActiveRecord::Migration
  def change
    create_table :terms_semisters do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.date :vacation_date
      t.date :reopening_date

      t.timestamps null: false
    end
  end
end
