class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  # Why does it need a condition?
  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(notes)
    # cycled through notes array and if not blank, shove into notes attribuate
    notes.each do |note|
      if note != ""
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    # returns a array of notes
    self.notes.collect do |note|
      note.content
    end
  end

end
