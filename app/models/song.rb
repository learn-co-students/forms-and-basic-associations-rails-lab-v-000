class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name:name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) unless content.strip.empty?
      # note = Note.find_or_create_by(content: content)
      # self.notes << note
    end
  end

  def note_contents
    # self.notes.map do |note|
    #   note.content unless note.content.empty?
    # end.compact
    
    self.notes.map(&:content)
  end

end
