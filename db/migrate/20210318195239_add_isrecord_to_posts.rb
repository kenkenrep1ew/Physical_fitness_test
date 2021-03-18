class AddIsrecordToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :is_record, :boolean
  end
end
