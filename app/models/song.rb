class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :genre_name
  attr_reader :artist_name


  def genre_name= (arg)
    self.genre = Genre.all.find_or_create_by(name:arg)
    self.save
    @genre_name = arg if self.persisted?
  end

  def artist_name=(arg)
    self.artist = Artist.all.find_or_create_by(name:arg)
    self.save
    @artist_name = arg if self.persisted?
  end

  def note_contents=(arg)
    arg.each{|content|self.notes.build(content: content) unless content.empty? }
   end

  def note_contents
     self.notes.collect(&:content)
  end


end
