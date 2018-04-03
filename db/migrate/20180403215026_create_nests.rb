class CreateNests < ActiveRecord::Migration
  def change
    create_table :nests do |t|
      t.string :make
      t.string :location

      t.timestamps null: false
    end
  end
end
