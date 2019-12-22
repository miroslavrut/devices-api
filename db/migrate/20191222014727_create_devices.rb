class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.references :device_type, foreign_key: true
      t.timestamps
    end
  end
end
