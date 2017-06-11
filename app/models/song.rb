class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        note = Note.find_or_create_by(content: content)   
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
