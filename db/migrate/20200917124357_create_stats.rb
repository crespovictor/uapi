class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.boolean :online
      t.boolean :switch
      t.integer :countdown
      t.integer :current
      t.integer :power
      t.integer :voltage
      t.datetime :date_time

      t.timestamps
    end
  end
end
