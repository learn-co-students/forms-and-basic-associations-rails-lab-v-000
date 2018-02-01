class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist = self.artist.name
  end

  def artist_name
    @artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    @genre = self.genre.name
  end

  def genre_name
    @genre
  end

  def note_contents=(content)
    if !content.empty?
      content.each do |c|
    self.notes << Note.find_or_create_by(content: c) if c != ""
    end
  end
end

  def note_contents
    @notes_array = []
    self.notes.each{|note| @notes_array << note.content}
    @notes_array
  end
end
