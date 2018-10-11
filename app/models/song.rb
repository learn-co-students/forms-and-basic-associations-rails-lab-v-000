class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def song_title=(title)
    self.title = Song.find_or_create_by(title: title)
  end

  def song_title
    self.title
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end
