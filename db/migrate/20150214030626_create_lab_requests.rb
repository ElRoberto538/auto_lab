class CreateLabRequests < ActiveRecord::Migration
  def change
    create_table :lab_requests do |t|
      t.string :request_file
      t.references :user, index: true
      t.string :name
      t.hstore :tests
      t.references :shedule, index: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
