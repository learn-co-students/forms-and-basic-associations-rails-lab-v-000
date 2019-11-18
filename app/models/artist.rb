class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
  has_many :genres, through: :songs

  def song_titles=(titles)
    titles.each do |title|
       song = Song.find_or_create_by(title: title)
       self.songs << song
     end
  end
end
