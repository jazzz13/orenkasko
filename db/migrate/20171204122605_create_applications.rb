class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|

      t.jsonb :data, null: false

      t.timestamps null: false
    end
  end
end
