class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # attr_reader :artist_name, :genre_name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) if !content.empty?
    end
    self.save
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end
end

