class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def note_contents=(content_array)
    content_array.each do |content|
      self.notes << Note.create(content: content) if content && content != ""
    end
    self.save
  end

end
