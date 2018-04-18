class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.name if artist
  end

  def note_contents=(contents)
    contents.reject!(&:empty?)
    self.notes += contents.map do |content|
      Note.find_by(content: content) || Note.create(content: content)
    end
  end

  def note_contents
    notes.map(&:content)
  end
end
