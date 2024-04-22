require 'rails_helper'
require_relative '../factories/post'
require_relative '../factories/user'
require_relative '../factories/tag'

RSpec.describe Post, type: :model do
  include FactoryBot::Syntax::Methods
  context 'validações' do
    it 'é válido com título e conteúdo presentes' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'é inválido sem título' do
      post = build(:post, titulo: nil)
      post.valid?
      expect(post.errors[:titulo]).to include("não pode ficar em branco")
    end

    it 'é inválido sem conteúdo' do
      post = build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("não pode ficar em branco")
    end
  end

  context 'associações' do
    it 'pertence a um usuário' do
      associação = described_class.reflect_on_association(:user)
      expect(associação.macro).to eq :belongs_to
    end
  end
end
