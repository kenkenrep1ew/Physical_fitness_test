class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :age
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
