class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	@artist = Artist.find_or_create_by(:name => name)
  	self.artist = @artist
  end

  def artist_name
  	self.artist.name if self.artist
  end

  def genre_name=(name)
    @genre = Genre.find_by(:name => name)
    self.genre = @genre
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(contents)
    contents.each do |note|
      self.notes << Note.create(:content => note)
    end
  end

  def note_contents
    @content = []
    self.notes.each do |note|
      @content << note.content unless note.content == ""
    end
    @content
  end
end

