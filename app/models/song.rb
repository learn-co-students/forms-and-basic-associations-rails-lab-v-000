class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

 def artist_name=(name)
 	self.artist = Artist.find_or_create_by(name: name)
 end

 def artist_name
 	unless self.artist.nil?
 		self.artist.name
 	end
 end

 def genre_name=(name)
 	genre = Genre.find_or_create_by(name: name)
 	self.genre = genre
 end

 def genre_name
 	unless self.genre.nil?
 		self.genre.name
 	end
 end

 def note_contents=(notes)
 	notes.each do |content|
 		if content.strip != ''
 			note = Note.create({content: content})
 			self.notes << note
 		end
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

