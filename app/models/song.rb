class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end
  
  def genre_name
    self.genre.name if self.genre != nil
  end
  
  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end
  
  def artist_name
    self.artist.name if self.artist != nil
  end
  
  def note_contents=(array_of_notes)
    array_of_notes.each do |note|
      self.notes.build(content: note) if note != ''
    end
  end
  
  def note_contents
    notes.collect do |note|
      note.content
    end
  end
end
