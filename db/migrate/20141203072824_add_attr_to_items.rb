class AddAttrToItems < ActiveRecord::Migration
  def change
  	add_column :items, :category, :string, default: ""
  	add_column :items, :price, :string, default: "0.00"
  end
end
