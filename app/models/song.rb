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

  def note_contents=(contents_array)
    contents_array.each do |note|
      if !note.blank?
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
