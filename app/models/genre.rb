class Genre < ActiveRecord::Base
  has_many :songs

  # def genre_name=(gname)
  #   self.genre = Genre.find_or_create_by(name: gname)
  # end
  #
  # def genre_name
  #   self.genre.name
  # end
end
