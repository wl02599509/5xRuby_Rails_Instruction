class AddColumnDeleteAtToArticlesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :deleted_at, :datatime
    add_index :articles, :deleted_at
  end
end
