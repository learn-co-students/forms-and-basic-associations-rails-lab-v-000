class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(notes)
    notes.select { |note| note != '' }.each { |note| self.notes.build(content: note) }
  end

  def song_notes
    self.note_contents
  end

  def song_notes=(notes)
    self.note_contents = notes
  end
end
