class AddFullUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :short_urls, :full_url, :string
  end
end
