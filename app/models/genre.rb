class Genre < ActiveRecord::Base
  has_many :songs

  def song_ids=(ids)
    ids.each do |id|
      song = Song.find_by(id: id)
      self.songs << song
    end
  end
  
end
