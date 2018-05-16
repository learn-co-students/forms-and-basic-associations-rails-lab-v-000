class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    existing_genre = Genre.find_by(name: name)
   if existing_genre.nil?
     self.genre = Genre.create!(name: name)
   else
     self.genre = existing_genre
   end
  end

  def genre_name
    self.genre.nil? ? 'Genre Not Defined' : self.genre.name
  end

  def artist_name=(name)
    existing_artist = Artist.find_by(name: name)
   if existing_artist.nil?
     self.artist = Artist.create!(name: name)
   else
     self.artist = existing_artist
   end
  end

  def artist_name
    self.artist.nil? ? 'Artist Not Defined' : self.artist.name
  end

  def note_contents=(notes)
     self.notes << notes.collect do | note |
      existing_note = Note.find_by(content: note)
      if note != ''
        existing_note.nil? ? Note.create!(content: note) : existing_note
      else
        nil
      end
    end.compact
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

end
