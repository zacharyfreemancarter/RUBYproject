class RemoveCourdetFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :courdet, foreign_key: true
  end
end
