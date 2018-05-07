class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

#we are building the custom setter method that allows songs to have many notes
#take each id and find that note object and push into the song.notes collection
  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end
end
