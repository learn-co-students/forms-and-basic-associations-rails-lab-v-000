class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end
 
   def genre_name
      self.genre ? self.genre.name : nil
   end
  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end
  def note_contents=(song_notes)
    song_notes.each do |note|
      if !note.empty?
        @note = Note.find_or_create_by(content: note)
        self.notes << @note
      end
    end
    self.notes
  end
 
   def note_contents
    self.notes.map do |note|
      note.content
    end
   end
end
