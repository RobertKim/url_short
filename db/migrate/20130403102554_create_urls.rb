class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |url|
      url.string :full_url, :short_url
      url.integer :counter, default: 0
      url.timestamps
    end
  end
end
