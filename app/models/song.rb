class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  attr_accessor :artist_name, :genre_id, :note_contents



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id=(id)
      genre = Genre.find(id)
      genre.songs << self
  end

  # def notes=(notes)
  #   binding.pry
  #   notes.each do |note|
  #     note = Note.find_or_create_by(content: note)
  #     self.notes << note
  #   end
  # end

  def note_contents
    self.notes.collect {|note| note.content}
   end

  def note_contents=(notes)
    notes.each do |note|
      note = Note.find_or_create_by(content: note)
      self.notes << note
    end
  end




end
