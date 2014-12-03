class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, default: ""
      t.string :store_name, default: ""
      t.string :lat, default: "0"
      t.string :long, default: "0"
      t.string :price, default: "0"

      t.timestamps
    end
  end
end
