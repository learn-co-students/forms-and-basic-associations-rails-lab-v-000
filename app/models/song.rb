class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

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
        @note = Note.new
        @note.content = content
        #binding.pry
        self.notes << @note
      end
    end
  end

  def note_contents
    #binding.pry
    contents = []
    self.notes.each do |note|
      contents << note.content
    end
    contents
  end
end
