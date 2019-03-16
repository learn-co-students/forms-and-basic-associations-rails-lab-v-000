class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
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

  # def content=(content)
  #    new_note = Note.create(content: content)
  #    new_note.song = self
  # end

  # def content
  #    self.content ? self.note.content : nil
  # end
end
