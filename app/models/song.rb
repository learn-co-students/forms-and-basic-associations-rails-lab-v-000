
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name, :genre_id

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes << Note.create(content: note) if !note.empty?
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end


  def genre_id=(id)
    self.genre = Genre.find(id)
  end



end

