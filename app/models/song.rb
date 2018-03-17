class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

   def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
   end

   def artist_name
     artist.name  if self.artist
   end

   def genre_name=(name)
     genre = Genre.find_or_create_by(name: name)
     self.genre = genre
   end

   def genre_name
     genre.name if self.genre
   end

   def note_contents=(notes)
     notes.each do |content|
       if !content.empty?
       self.notes.build(content: content)
     end
    end
   end

   def note_contents
     output = []
  self.notes.each do |x|
    output << x.content
  end
  output.delete_if {|x| x== ''}
end

end
