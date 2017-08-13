class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(note_contents)
    note_contents.each do |c|
      if c.strip != ""
        self.notes.build(content: c)
      end
    end
  end
end
