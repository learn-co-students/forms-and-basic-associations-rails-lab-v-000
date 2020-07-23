class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  #accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil 
  end

  def note_contents=(content)
    content.each do |c|
      if !c.empty?
        note = Note.create(content: c, song_id: self.id)
        self.notes << note
      end
  end

  end

end
