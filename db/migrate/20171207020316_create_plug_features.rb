class CreatePlugFeatures < ActiveRecord::Migration
  def change
    create_table :plug_features do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.string :state

      t.timestamps
    end

    add_index :plug_features, :name
    add_index :plug_features, :slug
  end
end
