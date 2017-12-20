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
    else
      ""
    end
  end
  
  def genre_name=(name)
     self.genre = Genre.find_by(name: name)
  end
  
  def genre_name
     self.genre.name
  end
  
  def genre_id=(id)
     self.genre = Genre.find(id)
  end
  
  def genre_id
    if self.genre
      self.genre.id
    else
      nil
    end
  end
  
  def note_contents=(noteStringArray)
     noteStringArray.each {|i|
        if !i.empty?
          n = Note.create({content: i})
          self.notes << n
        end
     }
  end
  
  def note_contents
     self.notes.map{|e|
       e.content
     }
  end
  
end

