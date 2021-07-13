# frozen_string_literal: true

class AddThemeToPlugSiteNotice < ActiveRecord::Migration[5.1]
  def change
    add_column :plug_site_notices, :theme, :string
  end
end
