class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self&.genre&.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    # self.artist.name
    self&.artist&.name

    # self.try(:artist).try(:name)

    # if self.artist
    #   self.artist.name
    # end
  end

  def note_contents=(contents)
    contents.each do |c|
      note = Note.find_or_create_by(content: c)
      self.notes << note if note.content != ""
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

end
