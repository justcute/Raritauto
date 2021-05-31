class RemoveRatingFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :rating
  end
end
