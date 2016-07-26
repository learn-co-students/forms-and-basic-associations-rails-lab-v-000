class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    try(:genre).try(:name)
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

  def note_contents=(new_notes)
    new_notes.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end
  
end