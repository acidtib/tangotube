class AddFeaturedIndexToVideos < ActiveRecord::Migration[7.0]
  def change
    add_index :videos, :featured
  end
end