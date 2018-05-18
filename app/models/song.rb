require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    # self.artist.name
  end

  def genre_name=(name)
    # self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  # Song note_contents= sets notes for a song
  # 'adds to existing notes'
  # 'ignores blank notes'

  # note_contents = collection of notes -- ignore if ""
  def note_contents=(contents)

  end

  # Song note_contents returns the content of all notes as an array
  # ex. song.note_contents = ['hi', 'there'] - notes have content
  def note_contents

  end

end
