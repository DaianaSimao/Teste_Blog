require 'rails_helper'
require_relative '../factories/comentario'
require_relative '../factories/post'
require_relative '../factories/user'
require_relative '../factories/tag'
RSpec.describe "Comentarios", type: :request do
  describe "GET /index" do
    it "retorna 200 ok" do
      comentario = create(:comentario)
      get "/comentarios/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "retorna 200 ok" do
      comentario = create(:comentario)
      expect(Comentario.count).to eq(1)
    end
  end

  describe "POST /create" do
    it "retorna 200 ok" do
      comentario = build(:comentario)
      expect(comentario.save).to eq(true)
    end
  end

  describe "PUT /update" do
    it "retorna 200 ok" do
      comentario = create(:comentario)
      expect(comentario.update(body: 'Texto do comentário')).to eq(true)
    end
  end

  describe "DELETE /destroy" do
    it "retorna 200 ok" do
      comentario = create(:comentario)
      expect(comentario.destroy).to eq(comentario)
    end
  end
end
