class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  @@notes = []

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by(name: artist_name)
    self.artist_id = @artist.id
  end

  def genre_name=(genre_name)
    @genre = Genre.find_or_create_by(name: genre_name)
    self.genre_id = @genre.id
  end

  def artist_name
    if self.artist_id
      @artist = Artist.find(self.artist_id)
      @artist.name
    end
  end

  def genre_name
    if self.genre_id
      @genre = Genre.find(self.genre_id)
      @genre.name
    end
  end

  def note_contents=(note)
    @@notes << note
  end

  def note_contents
    @@notes
  end

end
