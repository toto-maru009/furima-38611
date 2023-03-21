class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal_code,      null: false
      t.string :municipality,     null: false
      t.string :address,          null: false
      t.string :building_name,    null: true
      t.string :telephone_number, null: false
      t.integer :prefecture_id,   null: false
      t.references :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
