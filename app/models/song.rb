class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
     @genre_name = self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist_name = self.artist.name
  end

  def note_contents=(contents)
    @note_contents = []
    contents.collect do |content|
      content = content.to_s
      if content != "" && content != nil && content != ''
        newnote = Note.find_or_create_by(content: content)
        self.notes << newnote
        @note_contents << newnote.content
      end
    end
  end

  def note_contents
    self.notes.collect {|n| n.content}
  end

  def genre_name
    @genre_name
  end

  def artist_name
    @artist_name
  end
end

