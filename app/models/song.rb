class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def genre_name
    self.genre.name
  end
  
  def genre_name= (string)
    @genre = Genre.find_by(name: string)
    self.genre = @genre
  end
  
  def artist_name
    if self.artist != nil
    self.artist.name
    end
  end
  
  def artist_name= (string)
    @artist = Artist.new(name: string)
    @artist.save
    self.artist = @artist
  end
  
  def note_contents
    self.notes.map {|note| note.content}
  end
  
  def note_contents= (array)
    array.each do |note|
      if note != ""
      @note = Note.new(content: note)
      @note.save
      self.notes << @note
      self.save
      end
    end
  end
  
end

