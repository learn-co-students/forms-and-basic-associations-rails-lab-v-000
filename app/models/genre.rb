class Genre < ActiveRecord::Base

  has_many :songs

  # attr_accessor :name
  #
  # def initialize(name)
  #  @name = name
  # end

end
