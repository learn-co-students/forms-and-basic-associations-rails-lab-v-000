class RemoveArtistNameFromSong < ActiveRecord::Migration
  def change
    remove_column :songs, :artist_name, :string
  end
end
