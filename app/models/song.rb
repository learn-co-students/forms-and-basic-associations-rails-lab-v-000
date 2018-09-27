class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil   #if statement
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil   #if statement
  end

  def note_contents=(content)
    @notes = []
    content.each do |note|
      @note = Note.create(content: note)
      @notes << @note
    end
    self.notes = @notes #each !!
  end

  def note_contents
    self.note ? self.note.content : nil
  end

end
