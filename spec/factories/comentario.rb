FactoryBot.define do
  factory :comentario do
    body { 'Texto do comentário' }
    autor { 'Autor do comentário' }
    association :post
  end
end
