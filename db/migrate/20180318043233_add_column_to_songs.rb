class AddColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :note_id, :integer
  end
end
