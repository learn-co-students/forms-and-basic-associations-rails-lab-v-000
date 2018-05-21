require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  # Song note_contents= sets notes for a song
  # 'adds to existing notes'
  # 'ignores blank notes'


  # params = note_contents = ["note 1", "note 2", "note 3"]
  # need to fill -- note_contents: [] -- with input data
  # ignore if content =  ""

  # initiates at CREATE
  def note_contents=(note_array)#["note 1", "note 2", "note 3"]
    note_array.each do |content|
      if content.strip != ''
        self.notes.new(content: content)
      end
    end

  end

  # Song note_contents returns the content of all notes as an array
  # ex. song.note_contents = ['hi', 'there'] - notes have content
  def note_contents
    #=> []
    self.notes.collect(&:content)
  end
end
