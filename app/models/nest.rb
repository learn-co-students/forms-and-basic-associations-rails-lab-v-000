class Nest < ActiveRecord::Base
  belongs_to :sparrow

  def sparrow_name=(name)
    sparrow = Sparrow.find_or_create_by(name: name)
    self.update(sparrow_id: sparrow.id)
  end
end
