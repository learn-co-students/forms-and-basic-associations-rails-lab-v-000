class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #Genre Attr Setter
  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  #Genre Attr Getter
  def genre_name
    self.genre.name
  end

  #Artist Attr Setter
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #Artist Attr Getter
  def artist_name
    if self.artist
      self.artist.name
    end
    # self.try(:artist).try(:name)
  end

  #Notes Attr Setter (Maybe)
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end

end
