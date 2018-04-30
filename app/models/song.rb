class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
      if self.artist
        self.artist.name
      end
      #self.try(:artist).try(:name)
  end

  def genre_id=(id)
    genre = Genre.find_or_create_by(id: id)
    self.genre = genre
  end

  def genre_id
    if self.genre
      self.genre.id
    end
  end


end
