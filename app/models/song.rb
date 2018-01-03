class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #Setter Genre Attribute
  def genre_name=(name)
   self.genre = Genre.find_or_create_by(name: name)
  end

  #Reader Genre Attribute
  def genre_name
   self.genre.name
  end

  #Setter Song Attribute
  def artist_name=(name)
   self.artist = Artist.find_or_create_by(name: name)
  end

  #Reader Song Attribute
  def artist_name
   self.artist.name if self.artist
  end

  def note_contents=(notes)
    notes.each do |note|
      
      self.notes.build(content: note) unless note.empty?
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

end
