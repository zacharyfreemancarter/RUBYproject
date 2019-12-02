class AddPutimeToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :putime, :time
  end
end
