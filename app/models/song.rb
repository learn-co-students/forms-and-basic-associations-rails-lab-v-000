class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end 

  def genre_name
    self.try(:genre).try(:name)
  end 

  def artist_name 
    self.try(:artist).try(:name)
  end 

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist 
  end 

  def note_contents=(contents)
    contents.each do |content| 
      if !content.empty?
        note = Note.create(content: content, song_id: self.id)
        self.notes << note 
      end 
    end 
  end 

  def note_contents
    self.notes.map { |note| note.content }
  end 
end
