require 'rails_helper'
require_relative '../factories/user'

RSpec.describe User, type: :model do
  include FactoryBot::Syntax::Methods
  context 'validações' do
    it 'é válido com email, password e passsword_confirmation presentes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'é inválido sem email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("não pode ficar em branco")
    end

    it 'é inválido sem password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("não pode ficar em branco")
    end

    it 'é inválido com password diferente de password_confirmation' do
      user = build(:user, password: '123456', password_confirmation: '1234567')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("não é igual a Senha")
    end

    it 'é inválido com email duplicado' do
      user = create(:user, email: 'user@user.com')
      user = build(:user, email: 'user@user.com ')
      user.valid?
      expect(user.errors[:email]).to include("já está em uso")
    end
  end
end
