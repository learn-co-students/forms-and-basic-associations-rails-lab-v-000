class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many   :notes

  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if !artist.nil?
  end
end
