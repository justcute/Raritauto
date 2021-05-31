class AddParametersToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :parameter1, :int
    add_column :products, :parameter2, :int
    add_column :products, :parameter3, :int
    add_column :products, :parameter4, :int
    add_column :products, :parameter5, :int
    add_column :products, :rating, :float
  end
end
