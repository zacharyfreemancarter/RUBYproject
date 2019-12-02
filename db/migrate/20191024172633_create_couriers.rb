class CreateCouriers < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
