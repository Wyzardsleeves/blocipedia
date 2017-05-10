class AddAccessToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :access, :boolean
  end
end
