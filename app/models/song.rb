class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def note_contents=(notes)
    self.note = Note.find_or_create_by(content: notes)
  end
  def note_contents


  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note=
    self.note = Note.find_by-or_create_by(genre: enr)

  end
end
