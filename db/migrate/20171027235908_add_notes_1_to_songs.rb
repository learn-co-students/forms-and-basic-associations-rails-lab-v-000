class AddNotes1ToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :notes_1, :string
  end
end
