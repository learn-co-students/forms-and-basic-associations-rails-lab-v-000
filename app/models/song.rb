class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(notes)
    notes.each do |n|
      if n != ""
        note = Note.find_or_create_by(content: n)
        self.notes << note
      end
    end
   end

   def note_contents
     allnotes = []
    #  if self.notes.count == 1

     self.notes.each do |t|
       allnotes << t.content
      #  t.content << allnotes
     end
     allnotes
    # self.notes
   end

   def genre_name=(name)

   end

   def genre_name
     self.genre.name
   end

   def aritst_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def aritst_name
     self.artist.name
   end
end
