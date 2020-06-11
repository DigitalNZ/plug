# frozen_string_literal: true

class AddNoticeToPlugFeatures < ActiveRecord::Migration
  def change
    add_column :plug_features, :notice, :text
  end
end
