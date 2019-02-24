class Song < ActiveRecord::Base
  # add associations here
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

   def note_contents
     output = []
     if !notes.empty?
	     self.notes.each do |note|
	       note = Note.find(note.id)
	       output << note.content
	     end
	     output
     end
   end

   def note_contents=(notes)
   	if !notes.empty?
     notes.each do |note|
       if note != ""
       temp = Note.create(:content => note)
       self.notes << temp
       end
	 end
	end
   end

end
