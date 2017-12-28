class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.string :phone
      t.string :password
      t.string :name

      t.timestamps
    end

    add_reference :applications, :user, foreign_key: true

  end
end
