class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if !self.artist.nil?
      self.artist.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if !self.genre.nil?
      self.genre.name
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
        self.save
      end
    end
  end

  def note_contents
    if !self.notes.nil?
      self.notes.map do |note|
        @content = note.content
      end
    end
  end
end

