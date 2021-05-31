class AddSomeParametrsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :mark, :string
    add_column :products, :color, :string
    add_column :products, :engine, :string
  end
end
