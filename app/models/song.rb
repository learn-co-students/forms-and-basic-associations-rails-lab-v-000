class Song < ActiveRecord::Base
  attr_accessor :genre_name, :artist_name, :genre_id
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name
    self.genre.name if !!self.genre
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if !!self.artist
  end

  def note_contents=(contents)
    contents = contents.reject { |c| c.empty? }
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end

end
