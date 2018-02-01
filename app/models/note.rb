class Note < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :song
end
