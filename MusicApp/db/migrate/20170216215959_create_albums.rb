class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :band_id

      t.timestamps null: false
    end
    add_index :albums, :album_name
    add_index :albums, :band_id
  end
end
