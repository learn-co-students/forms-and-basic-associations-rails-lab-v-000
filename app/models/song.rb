class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
   artist.name if artist
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    genre.name if genre
  end

  def note_contents=(notes)
    notes.map {|note| self.notes.new(content: note) unless note.empty?}
  end

  def note_contents
    notes.map {|note| note.content}
  end

end
