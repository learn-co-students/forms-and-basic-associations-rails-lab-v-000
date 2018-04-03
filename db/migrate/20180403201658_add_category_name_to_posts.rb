class AddCategoryNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_name, :string
  end
end
