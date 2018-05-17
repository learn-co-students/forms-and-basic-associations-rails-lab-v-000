class Note < ActiveRecord::Base
  belongs_to :song
  validates :content, presence: true, length: {minimum: 1}
end
