class AddArtistNameToSong < ActiveRecord::Migration
  def change
    add_column :songs, :artist_name, :string
  end
end
