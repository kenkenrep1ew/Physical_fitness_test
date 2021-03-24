class ChangeIsRecordOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :is_record, :integer
  end
end
