class AddSchToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :sch, :int
  end
end
