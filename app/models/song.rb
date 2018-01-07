
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

   def artist_name
  	  self.artist.name if artist
   end 

   def artist_name=(name)
    	artist = Artist.find_or_create_by(name: name)
    	self.artist = artist
   end 

   def genre_name
    	self.genre.name if genre
   end 

   def genre_name=
   	  genre = Genre.find_or_create_by(name: name)
   	  self.genre = genre
   end 

   def note_contents
   		notes.each do |note|
   			if content.strip != ''
   				self.notes.build(content: content)
   			end 
   		end 
   end 

   def note_contents=(contents)
   		self.notes.map(&:content)
   	end 
end
# connects notes and content 
