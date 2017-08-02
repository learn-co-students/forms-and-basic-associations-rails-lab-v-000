class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

   def artist_name=(name)
     artist = Artist.find_or_create_by(name: name)
     self.artist = artist
   end

   def artist_name
     self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
    self.notes
  end

  def note_contents
    note_contents = []
    if self.notes
      self.notes.each do |note|
        note_contents << note.content
      end
    end
    note_contents
  end

end
