class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    artist.name if artist
  end

  def genre_name
    genre.name if genre
  end

  def artist_name=(name)
    a = Artist.find_or_create_by(name: name)
    self.artist = a
  end

  def genre_name=(name)
    g = Genre.find_or_create_by(name: name)
    self.genre = g
  end

  def note_contents
    notes.collect{|n| n.content}
  end

  def note_contents=(contents)
    contents.each{|content| notes.build(content: content) if !content.empty?}
  end
end
