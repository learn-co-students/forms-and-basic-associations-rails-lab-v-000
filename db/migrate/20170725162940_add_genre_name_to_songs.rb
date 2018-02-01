class AddGenreNameToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :genre_name, :string
  end
end
