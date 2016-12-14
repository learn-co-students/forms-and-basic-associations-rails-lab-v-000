class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :song_genre_id, :song_artist_name, :song_genre_id, :note_contents

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(note_ids)
    note_ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

end
