class Genre < ActiveRecord::Base
  has_many :songs

  def genre_name
    self.name if !nil?
  end
end
