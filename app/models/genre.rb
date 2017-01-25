class Genre < ActiveRecord::Base
  has_many :songs

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    # self.genre.name
    self.try(:genre).try(:name)
  end

end
