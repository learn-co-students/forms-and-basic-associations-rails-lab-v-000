class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  validates :title, presence: true
  
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

  def note_contents=(array)
    array.each do |note|
      if !note.blank?
        note = Note.find_or_create_by(content: note) 
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
