class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    if name != ""
      self.artist = Artist.find_or_create_by(name: name)
    end
  end

  def artist_name
    if self.artist != nil
      self.artist.name
    else
      nil
    end
  end

  def note_contents=(array)
    array.each do |note|
      if note != ''
        new_note = Note.new(content: note)
        self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
