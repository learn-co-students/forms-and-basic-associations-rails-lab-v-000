class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

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

  def note_contents
    self.notes.map  {|n| n.content} unless self.notes.empty?
  end

  def note_contents=(contents)
    contents.each {|c| self.notes << Note.create(content: c) unless c.empty?}
  end
end
