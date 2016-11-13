class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :notes_1, :notes_2

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def notes_1=(note)
    self.notes << Note.create(content:note)
  end

  def notes_2=(note)
    self.notes << Note.create(content:note)
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content) if content.empty? == false
    end
    # notes.each do |note|
    #   self.notes << Note.create(content:note) if note.empty? == false
    # end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

end
