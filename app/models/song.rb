class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes_array)
    notes_array.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def note_contents
    content_array = []
    self.notes.each do |note|
      content_array << note.content
    end
    content_array.delete("")
    content_array
  end
end

