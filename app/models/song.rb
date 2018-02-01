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
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      next if note.empty?
      n = Note.find_or_create_by(content: note)
      self.notes << n
    end
  end

  def note_contents
    self.notes.map {|n| n.content }
  end
end
