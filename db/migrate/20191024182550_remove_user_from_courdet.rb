class RemoveUserFromCourdet < ActiveRecord::Migration[5.0]
  def change
    remove_reference :courdets, :user, foreign_key: true
  end
end
