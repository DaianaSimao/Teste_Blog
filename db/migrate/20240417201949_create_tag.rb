class CreateTag < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :nome

      t.timestamps
    end
  end
end
