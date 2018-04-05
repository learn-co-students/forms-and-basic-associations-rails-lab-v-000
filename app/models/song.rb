class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.nil? ? nil : self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.nil? ? nil : self.genre.name
  end

  def note_contents=(note_contents)
    note_contents.reject!(&:empty?)
    
    note_contents.each do |note_content|
      self.notes.build(content: note_content)
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
