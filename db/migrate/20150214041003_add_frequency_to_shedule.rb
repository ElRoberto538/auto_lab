class AddFrequencyToShedule < ActiveRecord::Migration
  def change
    add_column :shedules, :frequency, :integer
  end
end
