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
    else
      nil
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
