class AddCourdetToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :courdet, foreign_key: true
  end
end
