class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def note_contents=(content)
      content.each { |el| self.notes << Note.find_or_create_by(content: el) unless el.empty? }
  end

  def genre_name
    self.genre.name
  end

   def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents
   self.notes.map { |note| note.content}
  end



end
