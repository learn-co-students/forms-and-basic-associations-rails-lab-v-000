class AddGenreToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :genre_id
  end
end
