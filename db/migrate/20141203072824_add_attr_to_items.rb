class AddAttrToItems < ActiveRecord::Migration
  def change
  	add_column :items, :category, :string, default: ""
  	add_column :items, :price, :string, default: "0.00"
  	add_column :items, :image_url, :string, default: ""
  end
end
