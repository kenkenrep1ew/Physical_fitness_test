class ChangeDataTimeToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :run, :string
    change_column :posts, :date, :Date
  end
end
