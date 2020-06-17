class Genre < ActiveRecord::Base
  has_many :songs
end

# Genre
# has a name attribute (String)
# has many songs
