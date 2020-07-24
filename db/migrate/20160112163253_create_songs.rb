class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :artist_id
      t.integer :genre_id
      t.timestamps null: false
    end
  end
end
