class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name 
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name) unless name == ""
  end

  def genre_id(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
    self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |note|
      unless note == ""
        self.notes.new(content: note)
      end
    end 
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end
  
end

