class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(note_contents)
    note_contents.each do |note|
      self.notes.build(content: note) if !note.empty?
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end
end
