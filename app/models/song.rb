
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if self.genre
  end



  def note_contents
    notes = Note.where(song_id: self.id)
    notes.collect do |note|
      note.content
    end if notes
  end

  def note_contents=(notes)
    notes.reject! { |c| c.empty? }
    notes.each do |note|
      self.notes << Note.create!(content: note, song_id: self.id)
    end
  end

end
