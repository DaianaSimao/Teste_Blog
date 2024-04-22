require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'Validação do metodo capitalize_nome' do
    tag = Tag.create(nome: 'ruby')
    expect(tag.nome).to eq('Ruby')
  end
end
