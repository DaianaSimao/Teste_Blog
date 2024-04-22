class AddColumnReferencesUserToComentario < ActiveRecord::Migration[7.0]
  def change
    add_reference :comentarios, :user, foreign_key: true
  end
end
