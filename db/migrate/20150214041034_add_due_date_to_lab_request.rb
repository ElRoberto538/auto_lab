class AddDueDateToLabRequest < ActiveRecord::Migration
  def change
    add_column :lab_requests, :due_date, :datetime
  end
end
