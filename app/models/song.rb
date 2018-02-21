require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
    self.save
  end

  def genre_name
    self.genre.name if self.genre
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
    self.save
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes << Note.create(content: content)
    end
  end

  def note_contents
    self.notes.select{|note| note.content if note.content != ""}.collect(&:content)
  end


end
