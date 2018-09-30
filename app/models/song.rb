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

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(name)
    name.each do |note|
      if note.strip != ""
        self.notes << Note.find_or_create_by(content: note)
      end
    end
    self.notes
  end

  def note_contents
    # binding.pry
    self.notes.collect { |note| note.content }
  end

end
