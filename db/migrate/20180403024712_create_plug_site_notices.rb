class CreatePlugSiteNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :plug_site_notices do |t|
      t.string :name
      t.string :slug
      t.text :notice
      t.string :state

      t.timestamps
    end

    add_index :plug_site_notices, :name
    add_index :plug_site_notices, :slug
  end
end
