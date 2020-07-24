class RemoveSongIdFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :song_id, :integer
  end
end
