class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist

  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
      new_note = Note.find_or_create_by(content: note)
        self.notes << new_note
      end
    end
  end

  def note_contents
    if self.notes
      notes.map do |note|
        note.content

  end
end
end

def genre_name=(id)
  self.genre = Genre.find_by(name: id)

end

def genre_name
  self.genre.name 
end
end
