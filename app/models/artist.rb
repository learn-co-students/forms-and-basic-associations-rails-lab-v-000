class Artist < ActiveRecord::Base
  has_many :songs
end

# Artist
# has a name attribute (String)
# has many Songs
