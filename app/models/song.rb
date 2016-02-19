class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

 def note_contents
  self.notes.map {|note| note.content} 
  end

  def note_contents=(notes)
    # binding.pry
    song = self
    notes.select {|f| !f.blank?}.each do |note|
      song.notes.build(content: note)
    end

  end

      # params[:song_notes].delete_if {|note| note.blank? }.each do |note|
    #   @song.notes.build(content: note)
    # end

end

