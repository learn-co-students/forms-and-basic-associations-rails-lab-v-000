class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(text)
    self.notes = Note.find_or_create_by(content: text)
   end

   def note_contents
     self.notes.content
   end

   def genre_name=(name)
     
   end

   def genre_name
     self.genre.name
   end

   def aritst_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def aritst_name
     self.artist.name
   end
end
