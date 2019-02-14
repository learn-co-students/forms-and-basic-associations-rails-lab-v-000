class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  validates :content, presence: true
end
