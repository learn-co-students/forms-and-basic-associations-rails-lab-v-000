class Note < ActiveRecord::Base
  validates :content, presence: true
  # add associations here
  belongs_to :Song
end
