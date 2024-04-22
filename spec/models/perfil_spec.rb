require 'rails_helper'
require_relative '../factories/perfil'

RSpec.describe Perfil, type: :model do
  include FactoryBot::Syntax::Methods
  context 'validações' do
    it 'é válido com nome e sobrenome presentes' do
      perfil = build(:perfil)
      expect(perfil).to be_valid
    end

    it 'é inválido sem nome' do
      perfil = build(:perfil, nome: nil)
      perfil.valid?
      expect(perfil.errors[:nome]).to include("não pode ficar em branco")
    end

    it 'é inválido sem sobrenome' do
      perfil = build(:perfil, sobrenome: nil)
      perfil.valid?
      expect(perfil.errors[:sobrenome]).to include("não pode ficar em branco")
    end
  end

  context 'associações' do
    it 'pertence a um usuário' do
      associação = described_class.reflect_on_association(:user)
      expect(associação.macro).to eq :belongs_to
    end
  end
end
