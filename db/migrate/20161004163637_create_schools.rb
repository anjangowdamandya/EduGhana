class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :email
      t.string :city
      t.string :region
      t.string :currency_type
      t.string :logo
      t.string :country

      t.timestamps null: false
    end
  end
end
