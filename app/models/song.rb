class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.nil? ? nil: self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.nil? ? nil: self.genre.name
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) unless content.empty?
    end
  end

  def note_contents
    if self.notes.empty?
      Array.new
    else
      self.notes.collect {|note|note.content}
    end
  end
end
