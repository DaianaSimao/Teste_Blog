require 'rails_helper'
require_relative '../factories/post'
require_relative '../factories/user'
require_relative '../factories/perfil'
require_relative '../factories/tag'
RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "retorna 200 ok" do
      get "/posts/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "retorna 200 ok" do
      post = create(:post)
      get "/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "retorna 200 ok" do
      post = create(:post)
      expect(post).to be_valid
    end
  end

  describe "PUT /update" do
    it "retorna 200 ok" do
      post = create(:post)
      post.titulo = "New Title"
      post.save
      expect(post.titulo).to eq("New Title")
    end
  end

  describe "DELETE /destroy" do
    it "retorna 200 ok" do
      post = create(:post)
      post.destroy
      expect(Post.all).to eq([])
    end
  end
  describe "POST #create_upload_post" do
    context "with valid parameters" do
      let(:user) { create(:user) } # Cria um usuário usando FactoryBot
      let(:valid_params) do
        {
          post: {
            body: "Lorem ipsum dolor sit amet",
            user_id: user.id # Passa o ID do usuário criado
            # Adicione outros parâmetros necessários aqui
          }
        }
      end
    end
  end
end
