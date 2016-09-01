class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(contents)
    contents.each do |note|
      if !note.empty?
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    #notes = []
    #self.try(:notes).try :each do |note|
    #  notes << note.content
    #end
    #notes
    self.notes.collect {|note| note.content}
  end

  def genre_name=(genre)
    genre = Genre.find_or_create_by(name: genre)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).name
  end
end
