class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre.present?
    self.genre.name
  else self.genre = nil
  end
  end

  def note_contents
    notes.collect {|note| note.content}
  end

  def note_contents=(notes)
    notes.each do |content|
    note = self.notes.build(content: content) unless content.empty?
    end
  end
  # add associations here
end
