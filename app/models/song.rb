class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist
  #Going to need a form for the Song's title, and to represent what genre and artist they belong to.
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
end
