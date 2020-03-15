class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :allow_destroy => true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    #setter method is called whenever Song is initialized with an artist_name field
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end
end
