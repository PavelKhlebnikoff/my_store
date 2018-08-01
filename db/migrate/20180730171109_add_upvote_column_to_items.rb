class AddUpvoteColumnToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :votes_count, :integer, defaut: 0
  end
end
