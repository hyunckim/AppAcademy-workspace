class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_name
      t.integer :album_id

      t.timestamps null: false
    end
    add_index :tracks, :track_name
    add_index :tracks, :album_id
  end
end
