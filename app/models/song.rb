class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)

  end

  def genre_name
    if genre.name
      self.genre.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def note_contents=(contents)
    # self.notes = Note.find_or_create_by(content: content)
    contents.each do |c|
      if c != ''
      nnn = Note.find_or_create_by(content: c)
      notes << nnn
    end
    end
  end

  def note_contents
    notes.collect do |f|
      f.content
    end
  end
end
