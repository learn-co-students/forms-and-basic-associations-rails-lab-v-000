class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name
    self.artist.try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    genre.try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(notes_content)
    notes_content.delete("")
    notes_content.each do |note|
        new_note =  Note.find_or_create_by(content: note)
        self.notes << new_note
    end
  end

  def note_contents
    note_contents = []
    self.notes.each do |note|
      note_contents << note.content
    end
    note_contents
  end
end
