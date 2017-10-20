class Song < ActiveRecord::Base
  # attr_accessor :genre_name, :artist_name

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def genre_name=(name)
  #   self.genre = Genre.find_or_create_by(name: name)
  # end
  #
  # def genre_name
  #   self.genre.name
  # end

  def genre_name=(name)
    found_genre = Genre.find_by(name: name)
    self.genre = found_genre
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    found_artist = Artist.find_or_create_by(name: name)
    self.artist = found_artist
  end

  def artist_name
    self.artist.name if !!self.artist
  end

  def note_contents=(inputs)
    inputs.each do |input|
      unless input.empty?
        new_note = Note.create(content: input)
        self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.collect{|note| note.content} if !!self.notes
  end

end
