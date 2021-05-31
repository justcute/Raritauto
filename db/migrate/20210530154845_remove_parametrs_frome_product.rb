class RemoveParametrsFromeProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :parameter1
    remove_column :products, :parameter2
    remove_column :products, :parameter3
    remove_column :products, :parameter4
    remove_column :products, :parameter5
  end
end
