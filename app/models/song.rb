class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
#    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
#    self.try(:artist).try(:name)
  end

  def note_contents=(content)
    content.each do |c|
      if c.strip != ""
        #self.notes.build(content: c)
        note = Note.find_or_create_by(content: c)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
end

