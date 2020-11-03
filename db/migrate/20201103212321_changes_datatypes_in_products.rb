class ChangesDatatypesInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 5, scale: 2
    add_column :products, :total_inventory, :integer
  end
end
