class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(notes)


    notes.collect do |note|
      unless note == ""
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
  
    self.notes.map(&:content)
  end

end
