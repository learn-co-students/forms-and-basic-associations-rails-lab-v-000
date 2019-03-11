class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  #def genre_id=(name)
  #  self.genre = Genre.find_or_create_by(name: name)
  #end

  #def genre_id
  #  self.genre ? self.genre.id : nil
  #end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |c|
      note = Note.find_or_create_by(:content => c)
      self.notes << note
    end
  end

  def note_contents
    contents = []
    self.notes.each do |n|
      if n.content != ""
        contents << n.content
      end
    end
    contents
  end

end
