class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def song_ids=(ids)
      ids.each do |id|
        song = Song.find(id)
        self.songs << song
    end
  end
end
