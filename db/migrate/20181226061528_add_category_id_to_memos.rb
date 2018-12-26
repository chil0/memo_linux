class AddCategoryIdToMemos < ActiveRecord::Migration[5.2]
  def change
    add_column :memos, :category_id, :integer, :default => 1
    Memo.reset_column_information
  end
end
