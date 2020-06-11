class Note < ActiveRecord::Base
  # add associations here, content attribute

  belongs_to :Song
end
