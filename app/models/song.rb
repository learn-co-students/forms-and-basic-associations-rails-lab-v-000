class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
<<<<<<< HEAD
      if self.artist
        self.artist.name
      end
      #self.try(:artist).try(:name)
=======
      #self.artist.name
      self.try(:artist).try(:name)
>>>>>>> 2543803dadaa781351423c8f90784e6aa5408eec
  end


end
