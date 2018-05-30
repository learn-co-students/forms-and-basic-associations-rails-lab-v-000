class AddSongToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :song, index: true, foreign_key: true
  end
end
