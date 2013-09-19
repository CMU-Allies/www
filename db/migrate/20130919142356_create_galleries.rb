class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :description
      t.integer :cover_image_id

      t.timestamps
    end
  end
end
