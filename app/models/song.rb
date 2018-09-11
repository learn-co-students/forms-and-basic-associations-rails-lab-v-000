class Song < ActiveRecord::Base
  # add associations here
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

  def note_contents=(content)
    @content = content.reject {|c| c.empty?}

    @content.each do |content|
      if self.notes
        self.notes << Note.create(content: content)
      else
        self.notes = []
        self.notes << Note.create(content: content)
      end
    end
  end

  def note_contents
    self.notes ? self.notes.collect {|n| n.content} : nil
  end
end
