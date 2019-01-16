class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
  has_many :genres, through: :songs

  #How do we specifiy many different songs to an artist?<select>?
    #Use array parameters with rails naming convention
  def song_ids=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.songs << song
    end
  end 
end
