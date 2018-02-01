class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many   :notes

  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if !artist.nil?
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if !genre.nil?
  end

  def note_contents=(contents)
    contents.each_with_index { |content, i|
      self.notes << Note.new(content:content) if content.size > 0
    }
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end
end
