class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if genre != nil
        genre.name
      end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if artist != nil
      artist.name
    end
  end

  def note_contents=(content)
    content.each do |e|
      if e != ''
        self.notes << Note.find_or_create_by(content: e)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
