class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre.name
  end
  
  def note_contents=(content_array)
    self.notes << content_array.reject(&:blank?).map { |content| Note.find_or_create_by(content: content) }
  end

  def note_contents
    self.notes.map { |note| note.content }
  end
  
  
end

