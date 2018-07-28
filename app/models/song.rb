class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  
   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end
   
   
   def genre=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end
 
   def genre
      self.genre ? self.genre.name : nil
   end
   
   
   def note=(name)
     self.note = Note.find_or_create_by(name: name)
   end
 
   def note_contents
      self.note ? self.note.contents : nil
   end

end

