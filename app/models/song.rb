class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes << Note.find_or_create_by(content: n)
    
    end
  end

  def note_contents
    output = []
    self.notes.each do |x|
      output << x.content
    end
    output.delete_if {|x| x== ''}
  end
end
