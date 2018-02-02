class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.try(:name)
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) unless !!content.empty?
    end
    self.save
  end

  def note_contents
    self.notes.try(:collect){|note| note.content}
  end
end
