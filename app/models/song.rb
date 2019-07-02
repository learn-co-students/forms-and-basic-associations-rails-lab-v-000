class Song < ActiveRecord::Base
 belongs_to :artist
 belongs_to :genre
 has_many :notes

 def artist_name=(name)
   self.artist = Artist.find_or_create_by(name: name)
 end

 def artist_name
   self.artist ? self.artist : nil
 end

 def genre_name=(name)
   self.genre = Genre.find_or_create_by(name: name)
 end

 def genre_name
   self.genre ? self.genre : nil
 end

 def song_notes=(name)
   self.note = Note.find_or_create_by(name: name)
 end

 def song_notes
   self.note.all
 end
 
end
