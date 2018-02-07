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

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    note_content = self.notes.collect do |note|
      note.content
    end
    note_content.reject do |content|
      content == ""
    end
  end
end
