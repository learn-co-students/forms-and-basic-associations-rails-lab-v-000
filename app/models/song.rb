class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes << Note.create(content: n) if n != ""
    end
  end

  def note_contents
    self.notes.map do |n|
      n.content
    end
  end

end
