class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if !self.artist.nil?
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if !self.genre.nil?
      self.genre.name
    end
  end

  def note_contents=(notess)
    notess.each do |note|
      self.notes << Note.create(content: note) if !note.empty?

    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

end
