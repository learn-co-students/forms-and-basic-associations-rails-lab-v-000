class AddSparrowIdToNests < ActiveRecord::Migration
  def change
    add_column :nests, :sparrow_id, :integer
  end
end
