class AddItemUrlToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :item_url, :string
  end
end
