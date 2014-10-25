class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.string :station
      t.string :country
      t.string :region
      t.string :city
      t.string :address
      t.decimal :lat
      t.decimal :long
      t.decimal :reg_price
      t.decimal :mid_price
      t.decimal :pre_price
      t.decimal :diesel_price
      t.integer :reg_update
      t.integer :mid_update
      t.integer :pre_update
      t.integer :diesel_update

      t.timestamps
    end
  end
end
