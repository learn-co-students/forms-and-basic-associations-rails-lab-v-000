require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name unless genre == nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless artist == nil
  end

  def note_contents=(contents_array)
    # binding.pry
    contents_array.reject(&:empty?).each do |content|
      self.notes << Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    # binding.pry
    self.notes.collect do |note|
      note.content
    end
  end
end
