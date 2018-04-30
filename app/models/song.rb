class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents
    thing = []
    if self.notes
      self.notes.each do |note|
        thing << note.content
      end
    end
    thing.reject(&:blank?)
  end

  def note_contents=(arr)
    arr.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end

end
