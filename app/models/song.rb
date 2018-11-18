
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

   def artist_name
     self.artist ? self.artist.name : nil
   end

   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def note_contents
     if self.notes
       self.notes.map{|note| note.content}
     end
   end

   def note_contents=(content)
     content.delete_if(&:blank?) 
     content.each do |content| a = Note.find_or_create_by(content: content)
       a.song = self
       self.notes << a
     end
   end
  # add associations here
end
