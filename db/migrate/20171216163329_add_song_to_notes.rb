class AddSongToNotes < ActiveRecord::Migration
  def change
    add_index :notes, :song_id
  end
end
