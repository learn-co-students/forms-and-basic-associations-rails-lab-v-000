class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(content)
    # binding.pry
    content.each do |c|
      self.notes.build(content: c) if c != ""
    end
  end

  def note_contents
    # return an array of note contents
    new_array = []
    self.notes.each do |note|
      new_array << note.content
    end
    new_array
    # self.notes if self.notes.length > 0
  end

end
