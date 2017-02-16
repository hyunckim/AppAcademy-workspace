class AddColumns < ActiveRecord::Migration
  def change
    add_column :albums, :form, :string
    add_column :tracks, :form, :string
  end
end
