class AddArtistToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :artist_id
  end
end
