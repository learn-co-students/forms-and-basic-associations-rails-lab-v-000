class AddNoteContentsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :note_contents, :string
  end
end
