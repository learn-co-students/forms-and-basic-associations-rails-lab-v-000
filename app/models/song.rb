class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(art_name)
    self.artist = Artist.find_or_create_by(name: art_name)
  end
  
  def artist_name
    self.try(:artist).try(:name)
  end
  
  def genre_name=(gen_name)
    self.genre = Genre.find_or_create_by(name: gen_name)
  end
  
  def genre_name
    self.try(:genre).try(:name)
  end    
  
  def note_contents=(notes)
    notes.each do |x|
      if x.strip != ""
        self.notes.build(content: x)
      end
    end
  end
  
  def note_contents
    self.notes.map { |x| x.content }
  end  
  
end

