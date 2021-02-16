class AddNoticeToPlugFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :plug_features, :notice, :text
  end
end
