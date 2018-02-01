class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.collect{|note| note.content}
  end

  def note_contents=(contents)
    contents.each do |note|
      self.notes << Note.create(content: note) if !note.empty?
    end
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_by(name: genre_name)
  end

  def genre_name
    self.genre.name if self.genre
  end
end
