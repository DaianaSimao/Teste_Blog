FactoryBot.define do
  factory :post do
    titulo { "Título do post" }
    body { "Texto do post" }
    user { FactoryBot.create(:user) } # Cria um usuário associado
    tags { [FactoryBot.create(:tag)] } # Cria uma tag associada
  end
end
