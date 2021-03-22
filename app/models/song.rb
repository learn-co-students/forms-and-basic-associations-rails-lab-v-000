class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

#artist method to be able to ask for the artist name in the view
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.artist= artist
  end

  def artist_name
   self.artist ? self.artist.name : nil
  end

#for genre
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
          note = Note.create(content: content, song_id: self.id)
          self.notes << note
      end
    end
  end
#for notes

  def note_contents
  self.notes.map { |note| note.content }
  end


end
