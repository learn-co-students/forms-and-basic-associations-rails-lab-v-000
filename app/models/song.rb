class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

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

# build method ?
  def note_contents=(notes)
   notes.each do |content|
     if !content.empty?
       content = Note.create(content: content)
       self.notes << content
     end
   end
  end

# mapping proc ?
  def note_contents
    @notes = []
    self.notes.each do |note|
      @notes << note.content
    end
    @notes
  end

end # Song
