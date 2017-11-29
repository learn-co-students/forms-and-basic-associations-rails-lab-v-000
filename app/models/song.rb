class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    unless self.artist == nil
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    unless self.notes.empty?
      self.notes.collect {|note| note.content}
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) unless note.empty?
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end
end
