class Genre < ActiveRecord::Base
  has_many :songs 

  def genre_name(name)
    @genre_name = name
  end

  def genre_name=(name)
    Genre.find_or_create_by(name: name)
  end
end