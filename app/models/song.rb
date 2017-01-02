class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end



  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def note_contents
    notes.map do |note|
      note.content
    end
  end


  def notes=(notes_array)
    notes_array.each do |content|
      notes << Note.create(content: content) if !content.nil?
    end
  end

  def genre_name=(name)
    self.genre = Genre.create(name: name)
  end

  def genre_name
    genre.name
  end

  def note_contents=(notes_array)
    notes_array.each do |content|
      self.notes << Note.create(content: content) if !content.empty?
    end
  end




end
