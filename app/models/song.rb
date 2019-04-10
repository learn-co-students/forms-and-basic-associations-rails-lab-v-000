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

  def note_contents=(note_contents)
    # binding.pry
    note_contents.each do |content|
      if !content.empty?
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content ? note.content : nil}
  end

end
