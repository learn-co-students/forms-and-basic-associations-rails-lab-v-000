class CreateSparrows < ActiveRecord::Migration
  def change
    create_table :sparrows do |t|
      t.string :name
      t.string :species

      t.timestamps null: false
    end
  end
end
