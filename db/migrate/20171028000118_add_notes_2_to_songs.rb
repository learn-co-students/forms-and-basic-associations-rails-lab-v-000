class AddNotes2ToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :notes_2, :string
  end
end
