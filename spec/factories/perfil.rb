FactoryBot.define do
  factory :perfil do
    nome { 'João' }
    sobrenome { 'Silva' }
    user { FactoryBot.create(:user) }
  end
end
