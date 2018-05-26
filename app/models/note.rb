class Note < ActiveRecord::Base
  belongs_to :song
  validates :content, length: {minimum: 1}
end
