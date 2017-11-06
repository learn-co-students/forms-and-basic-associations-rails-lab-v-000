class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(:name => name)
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      nil
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def note_contents
    self.note.content
  end

  def note_contents=(content)
    self.note = Note.find_or_create_by(:content => content)
  end
end
