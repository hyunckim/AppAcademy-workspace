class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :band_name, null: false

      t.timestamps null: false
    end
    add_index :bands, :band_name
  end
end
