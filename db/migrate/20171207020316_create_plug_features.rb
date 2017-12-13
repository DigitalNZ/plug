class CreatePlugFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :plug_features do |t|
      t.string :name
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
