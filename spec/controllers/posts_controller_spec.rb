require 'rails_helper'
require_relative '../factories/post'
require_relative '../factories/user'
require_relative '../factories/perfil'
require_relative '../factories/tag' 

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'retorna uma resposta bem-sucedida e renderiza o template de índice' do
      get :index

      expect(response).to be_successful
      expect(response).to render_template(:index) 
    end
  end

  describe 'GET #show' do
    let(:post) { FactoryBot.create(:post) }

    it 'renderiza o template de exibição' do
      get :show, params: { id: post.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renderiza template new' do
      user = create(:user)
      sign_in user

      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_data) { FactoryBot.attributes_for(:post) }
    context 'com parametros validos' do

      it 'creates a new post' do
        post = build(:post)
        expect(post).to be_valid
      end
    end

    context 'com parametros invalidos' do
      let(:invalid_params) { { titulo: nil, body: 'Body of the new post' } }

      it 'does not create a new post' do
        user = create(:user)
        sign_in user
        expect {
          post :create, params: { post: invalid_params }
        }.to_not change(Post, :count)
        expect(response).to render_template(:new)
      end
      it 'renderiza o template new com status unprocessable_entity' do
        user = create(:user)
        sign_in user
        post :create, params: { post: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    it 'Atualiza e redireciona ' do
      post = build(:post, titulo: 'New Title')
      post.save
      user = create(:user)
      sign_in user
      expect(post.titulo).to eq('New Title')
      expect(response).to have_http_status(:ok)
    end
  end


  describe 'DELETE #destroy' do
    it 'deleta o post' do
      post = create(:post)
      post.destroy
      expect(Post.all).to eq([])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #upload_post' do
    it 'atribui um novo cargo a @post' do
      user = create(:user)
      sign_in user
      get :upload_post
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  it 'renderiza o template upload_post' do
    user = create(:user)
    sign_in user
    get :upload_post
    expect(response).to render_template(:upload_post)
  end
end
