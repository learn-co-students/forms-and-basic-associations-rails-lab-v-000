class Note < ActiveRecord::Base
  belongs_to :song

  validates_presence_of :content
end
