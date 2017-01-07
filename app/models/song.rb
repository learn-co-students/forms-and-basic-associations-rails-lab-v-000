class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  attr_accessor :artist_name
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist_name = self.artist.name
  end
 
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre.name
  end
  
  def notes=(entries)
    entries.each do |entry|
      note = Note.find_or_create_by(content: entry)
      self.notes << note
    end
  end
  
  def note_contents=(entries)
    entries.each do |entry|
      if !entry.empty?
        note = Note.find_or_create_by(content: entry)
        self.notes << note
      end
    end
  end
  
  def note_contents
    output = []
    self.notes.each do |note|
      output << note.content
    end
    output
  end
  
end

