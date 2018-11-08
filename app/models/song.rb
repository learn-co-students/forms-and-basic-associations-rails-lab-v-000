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

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      if self.genre.name
        self.genre.name
      end
    end
      #self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
     contents.each do |c|
       if c.strip != ''
         note = Note.find_or_create_by(content: c)
         self.notes << note
       end
     end
   end

   def note_contents
     array = []
     self.notes.each do |note|
       array << note.content
    end
    array
   end



end
