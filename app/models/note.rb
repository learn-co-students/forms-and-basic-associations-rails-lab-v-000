class Note < ActiveRecord::Base
  # add associations here
  belongs_to :songs
end
