class AddPaidToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :paid, :boolean
  end
end
