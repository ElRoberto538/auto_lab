class CreateLabTypes < ActiveRecord::Migration
  def change
    create_table :lab_types do |t|
      t.string :name
      t.references :lab_request, index: true

      t.timestamps
    end
  end
end
