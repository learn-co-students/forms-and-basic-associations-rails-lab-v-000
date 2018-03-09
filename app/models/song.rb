class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.nil? ? "" : self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.nil? ? "" : self.artist.name
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    if self.notes.nil?
      []
    else
      self.notes.collect do |note|
        note.content
      end
    end
  end

end
