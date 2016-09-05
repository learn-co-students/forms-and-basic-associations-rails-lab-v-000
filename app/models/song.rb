class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name

  def artist_name=(name)
    # binding.pry
    self.artist = Artist.find_or_create_by(name: name)
  end

end
