class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    genre = Artist.find_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  # def note_contents=(arr)
  #   notes = Note.where(name:content)
  # end
  #
  # def note_contents
  #   self.note_contents
  # end
end
