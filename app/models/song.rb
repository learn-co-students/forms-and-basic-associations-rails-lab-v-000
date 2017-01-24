
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name
  end

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end


  def note_contents
    self.note_contents
  end

  def note_contents=(content)
    self.notes = Note.find_or_create_by(content: content)
  end

end

