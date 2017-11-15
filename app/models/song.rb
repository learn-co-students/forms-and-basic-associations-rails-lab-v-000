class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(content)
    content.each do |content|
      if !content.blank?
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end
  def artist_name
    self.artist.name if self.artist
  end
end

