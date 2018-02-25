class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
     if self.artist
      self.artist.name
    end
   end

   def note_contents=(notes)
     notes.each do |note|
       if !note.empty?
         self.notes << Note.create(content: note)
       end
     end
   end

   def note_contents
     notes = []
     if !self.notes.empty?
       self.notes.each do |note|
       notes << note.content
      end
     end
     notes
   end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end

   def genre_name
     if self.genre
      self.genre.name
    end
   end
end
