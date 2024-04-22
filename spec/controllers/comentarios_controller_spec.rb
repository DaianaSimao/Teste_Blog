require 'rails_helper'
require_relative '../factories/comentario'
require_relative '../factories/post'
require_relative '../factories/user'

#
RSpec.describe ComentariosController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'POST #create' do
    context 'com parametros valida' do
      it 'creates a new comment' do
        comentario = build(:comentario)
        expect(comentario).to be_valid
      end
    end
  end

  describe "valida o comentário com parâmetros inválidos" do
    let(:post) { create(:post) }
    
    it 'não cria um novo comentário' do
      comentario = Comentario.create(body: nil, post_id: nil, autor: nil)

      expect(comentario).to_not be_valid
    end
  end
  

  describe 'DELETE #destroy' do
    it 'Deleta um comentario' do
      comentario = create(:comentario)
      comentario.destroy
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    it 'Edita um comentario' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "atribui Comentario como @comentario" do
      get :new
      expect(assigns(:comentario)).to be_a_new(Comentario)
    end
  end
end
