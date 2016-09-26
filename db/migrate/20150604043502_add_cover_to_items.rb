class AddCoverToItems < ActiveRecord::Migration
  def change
    add_attachment :items, :cover
  end
end
