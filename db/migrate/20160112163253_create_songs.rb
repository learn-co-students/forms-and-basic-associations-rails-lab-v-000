class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist_name
      t.string :genre_name
      t.text :note_contents
      t.string :notes_1
      t.string :notes_2
      t.timestamps null: false
    end
  end
end
