require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist
  end

  def note_contents=(content)
    binding.pry
      notes.each do |content|
      self.notes.build(:content => content)
    end
  end

  def note_contents
    notes.each do |content|
      content
    end
  end


end
