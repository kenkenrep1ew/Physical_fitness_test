class AddRunMinToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :run_min, :integer
  end
end
