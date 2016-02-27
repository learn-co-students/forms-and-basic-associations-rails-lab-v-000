require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def notes=(notes)
    notes.each{|note| self.notes.new(content: note) unless note == "" }
  end

  def note_contents
    self.notes.map{|note| note.content}
  end
end

