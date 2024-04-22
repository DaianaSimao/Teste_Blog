class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.references :post, null: false, foreign_key: true
      t.string :autor
      t.text :body

      t.timestamps
    end
  end
end
