class Genre < ActiveRecord::Base
  has_many :songs

  def genre_name 
    self.name
  end

end
