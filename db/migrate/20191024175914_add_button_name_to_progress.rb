class AddButtonNameToProgress < ActiveRecord::Migration[5.0]
  def change
    add_column :progresses, :button_name, :string
  end
end
