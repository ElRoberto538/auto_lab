class AddTestsToShedule < ActiveRecord::Migration
  def change
    add_column :shedules, :tests, :hstore
  end
end
