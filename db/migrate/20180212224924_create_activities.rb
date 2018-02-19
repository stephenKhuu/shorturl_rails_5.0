class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :ip_address
      t.decimal :lat
      t.decimal :long
      t.string :user_agent
      t.references :short_url, foreign_key: true

      t.timestamps
    end
  end
end
