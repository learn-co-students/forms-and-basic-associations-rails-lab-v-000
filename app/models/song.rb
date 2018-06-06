class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if artist
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note unless note.content.empty?
    end
  end

  def note_contents
    contents = []
    self.notes.each do |note|
      contents << note.content
    end
    contents
  end
end
