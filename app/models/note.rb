class Note < ActiveRecord::Base
  # add associations here
  validates_presence_of :content
  belongs_to :song


end
