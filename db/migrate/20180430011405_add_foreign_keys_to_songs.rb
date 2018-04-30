class AddForeignKeysToSongs < ActiveRecord::Migration
  def change
     add_reference :songs, :artist, index: true, foreign_key: true
     add_reference :songs, :genre, index: true, foreign_key: true
     add_reference :notes, :song, index: true, foreign_key: true
  end
end
