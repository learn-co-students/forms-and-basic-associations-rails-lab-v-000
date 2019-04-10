class Note < ActiveRecord::Base
  has_one :song
end
