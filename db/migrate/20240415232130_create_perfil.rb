class CreatePerfil < ActiveRecord::Migration[7.0]
  def change
    create_table :perfis do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :sobrenome
      t.string :bio

      t.timestamps
    end
  end
end
