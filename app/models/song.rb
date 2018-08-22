
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
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def note_contents=(notes)
    notes.each do |content|
      self.notes << Note.find_or_create_by(content: content) unless content.strip.empty?
    end
  end
  
  def note_contents
    if self.notes
      self.notes.collect { |note| 
        note.content unless note.content.to_s.strip.empty? 
      }.compact
    end
  end
  
end

