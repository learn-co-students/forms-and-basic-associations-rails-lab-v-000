class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ''
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
