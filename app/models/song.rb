class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
   def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre_name
  end    

  def artist_name
    self.artist_name
    
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect(&:content)
  end
end
