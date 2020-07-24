class RemoveArtistIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :artist_id, :integer
  end
end
