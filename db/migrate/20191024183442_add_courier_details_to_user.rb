class AddCourierDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_courier, :boolean
    add_column :users, :is_online, :boolean
  end
end
