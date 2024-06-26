class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :titulo
      t.text :body

      t.timestamps
    end
  end
end
