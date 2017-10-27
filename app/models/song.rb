class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id=(id)
    self.genre_name=(id)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    arr = []
    self.notes.each do |note|
      if note.content != ""
        arr << note.content
      end
    end
    arr
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.create!(content: content)
      self.notes << note
    end
  end

end
