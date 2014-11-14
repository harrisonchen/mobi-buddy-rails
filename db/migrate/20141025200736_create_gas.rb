class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.string :station
      t.string :station_id
      t.string :zip
      t.string :country
      t.string :region
      t.string :city
      t.string :address
      t.string :lat
      t.string :lng
      t.string :diesel
      t.string :reg_date
      t.string :mid_date
      t.string :pre_date
      t.string :diesel_date
      t.string :reg_price
      t.string :mid_price
      t.string :pre_price
      t.string :diesel_price
      t.string :reg_update
      t.string :mid_update
      t.string :pre_update
      t.string :diesel_update
      t.string :distance
      t.string :credit, default: "0"
      t.string :carwash, default: "0"
      t.string :hours

      t.timestamps
    end
  end
end
