require 'byebug'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    artist = Artist.create(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.create(content: content)
        self.notes << note
      end
    end
    self.notes
  end

  def note_contents
    self.notes.collect {|c| c.content}
  end
end
