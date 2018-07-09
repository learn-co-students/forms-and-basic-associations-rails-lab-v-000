class Note < ActiveRecord::Base
  belongs_to :song

  def notes=(ids)
    ids.each do |id|
      notes = Notes.find(id)
      self.notes << note
    end
  end 
  
end
