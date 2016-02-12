class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def note_ids=(ids)
  #   ids.each do |id|
  #     song = Song.find(id)
  #     songs << song 
  #   end
  # end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if !self.artist.nil?
      self.artist
    end
  end

  def genre_ids=(ids)
    ids.each do |id|
      genre = Genre.find(id)
      genres << genre
    end
  end 

  def genre_id
    if !self.genre.nil?
      self.genre
    end 
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end


end #ends class

