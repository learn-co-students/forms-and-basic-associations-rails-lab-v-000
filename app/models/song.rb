class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
  	self.artist.name if self.artist != nil  
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name
  	self.genre.name if self.genre != nil  
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

   def note_contents=(notes)
    notes.each do |content|
       self.notes.new(content: content) if content != ''
    end
  end

  def note_contents
    self.notes.collect{|c| c.content}
  end

end

