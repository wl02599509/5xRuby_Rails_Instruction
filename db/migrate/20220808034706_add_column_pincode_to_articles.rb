class AddColumnPincodeToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :pin_code, :string
  end
end
