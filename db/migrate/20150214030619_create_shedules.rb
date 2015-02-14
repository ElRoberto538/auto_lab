class CreateShedules < ActiveRecord::Migration
  def change
    create_table :shedules do |t|
      t.datetime :due_date
      t.references :user, index: true
      t.text :notes
      t.integer :max_recurrences
      t.references :lab_type, index: true

      t.timestamps
    end
  end
end
