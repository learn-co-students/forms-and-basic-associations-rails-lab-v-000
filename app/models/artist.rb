require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs

end
