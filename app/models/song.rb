class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |note_content|
      if note_content != ""
        note = Note.find_or_create_by(content: note_content)
        self.notes << note
      end
    end
  end

  def note_contents
    note_array = []
    self.notes.each do |note|
      note_array << note.content
    end
    note_array
  end
end
