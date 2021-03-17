class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.date :date
      t.integer :push_up
      t.integer :sit_up
      t.time :run

      t.timestamps
    end
  end
end
