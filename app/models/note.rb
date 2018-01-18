class Note < ActiveRecord::Base
  belongs_to :song
  #validates :note, presence: true
end
