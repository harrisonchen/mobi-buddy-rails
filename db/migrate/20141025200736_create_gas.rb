class CreateGas < ActiveRecord::Migration
  def change
    create_table :gas do |t|
      t.string :station
      t.string :station_id, default: "0"
      t.string :zip
      t.string :country
      t.string :region
      t.string :city
      t.string :address
      t.string :lat
      t.string :lng
      t.string :diesel, default: "0"
      t.string :reg_date, default: "0"
      t.string :mid_date, default: "0"
      t.string :pre_date, default: "0"
      t.string :diesel_date, default: "0"
      t.string :reg_price, default: "0"
      t.string :mid_price, default: "0"
      t.string :pre_price, default: "0"
      t.string :diesel_price, default: "0"
      t.string :reg_update, default: "RCART"
      t.string :mid_update, default: "RCART"
      t.string :pre_update, default: "RCART"
      t.string :diesel_update, default: "RCART"
      t.string :distance
      t.string :credit, default: "0"
      t.string :carwash, default: "0"
      t.string :hours, default: "0"

      t.timestamps
    end
  end
end
