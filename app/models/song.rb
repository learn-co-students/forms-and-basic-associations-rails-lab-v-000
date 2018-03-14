class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def artist_name=(name)
    if name
     self.artist = Artist.find_or_create_by(name: name) 
   end
  end
  
  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      self.notes << Note.find_or_create_by(content: content) unless content == ''
    end
  end
  
  def note_contents
    self.notes.map(&:content)   # so cool! equivalent to: {|note| note.content}
  end
  
  
end

