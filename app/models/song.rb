class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
  end
end
end
