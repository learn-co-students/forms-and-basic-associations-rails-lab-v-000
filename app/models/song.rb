class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(:name => name)
  end

  def artist_name
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(note_contents)
    note_contents.find_all { |content| !content.empty? }.each do |content|
      self.notes.build(content: content).save
    end
  end

  def note_contents
    self.notes.collect { |note| note.content}
  end
end
