class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  #validates :title, presence: :true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

  def note_contents
    @note_array = []
    self.notes.each do |note|
      @note_array << note.content
    end
    @note_array
    end
  end




