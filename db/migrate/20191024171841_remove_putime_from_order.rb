class RemovePutimeFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :putime, :string
  end
end
