class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end



  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end



  def note_contents
    self.notes.collect(&:content) if self.notes
  end

  def note_contents=(notes)
    notes.reject(&:blank?).each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

end

