class Genre < ActiveRecord::Base
  has_many :songs

  # def genre_name=(genre_id)
  #   byebug
  #   self.genre_name = Genre.find_or_create_by(id: genre_id)
  # end

  # def genre_name
  #   # byebug
  #   self.genre ? self.name : nil
  # end
end
