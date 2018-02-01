class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(notes_array)
    notes_array.each do |content|
      if !content.empty?
        self.notes << Note.find_or_create_by(content: content)
      end
    end
  end

  def note_contents
    notes_array = []
    self.notes.each do |note|
      notes_array << note.content
    end
    notes_array
  end

end
