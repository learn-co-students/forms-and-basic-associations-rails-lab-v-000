class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

attr_reader :artist_name, :genre_name, :note_contents

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(artist)
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(genre)
  end

  def note_contents=(contents)

  end
end
