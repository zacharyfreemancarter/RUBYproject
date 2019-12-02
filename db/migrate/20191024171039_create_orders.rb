class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :pulocation
      t.string :puname
      t.date :putime
      t.string :puaddress
      t.integer :puzipcode
      t.string :doaddress
      t.integer :dozipcode
      t.text :notes
      t.float :tip
      t.integer :step

      t.timestamps
    end
  end
end
