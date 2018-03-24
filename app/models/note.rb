class Note < ActiveRecord::Base
  belongs_to :song
  validates :content, presence: true, allow_blank: false
end
