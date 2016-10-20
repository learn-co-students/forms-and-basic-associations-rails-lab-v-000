class Note < ActiveRecord::Base
  belongs_to :song
  # belongs_to :artist, through: :song
  # belongs_to :genre, through: :song

end
