class AddPrecisionToLatLong < ActiveRecord::Migration[5.1]
  def up
    change_column :activities, :lat, :decimal, :precision => 15, :scale => 10
    change_column :activities, :long, :decimal, :precision => 15, :scale => 10
  end

  def down
    change_column :activities, :lat, :decimal
    change_column :activities, :long, :decimal
  end
end
