class CreateCourdets < ActiveRecord::Migration[5.0]
  def change
    create_table :courdets do |t|
      t.boolean :online
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
