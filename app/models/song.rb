class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes
  
   def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
  
   def artist_name
    self.try(:artist).try(:name)
  end
  
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).try(:name)
  end    
  
  def note_contents=(note_content)
    
    note_content.each do |attribute|
     
      if attribute.strip != ''
        self.notes.build(content: attribute)
      else 
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
