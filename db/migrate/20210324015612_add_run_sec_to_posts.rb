class AddRunSecToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :run_sec, :integer
  end
end
