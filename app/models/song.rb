class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name
    self.genre.name if genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end
end
