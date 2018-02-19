class CreateShortUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :short_urls do |t|
      t.string :short_id
      t.string :url_hash

      t.timestamps
    end
  end
end
