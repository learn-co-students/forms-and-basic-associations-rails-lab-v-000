class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
  end
 
  def artist_name
      self.artist.name if self.artist
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(content)
    content.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    all_contents = []
    self.notes.each do |note|
      all_contents << note.content unless note.content.empty?
    end
    all_contents
  end
end
