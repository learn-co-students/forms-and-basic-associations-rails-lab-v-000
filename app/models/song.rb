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

  def note_contents
    self.notes.collect {|note| note.content}
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ""
        content = self.notes.build(content: note)
        content.save
      end
    end
  end
end
