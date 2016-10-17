class AddColumnsToBatches < ActiveRecord::Migration
  def change
    add_column :batches, :report_id, :integer
  end
end
