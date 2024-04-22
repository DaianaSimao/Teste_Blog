require 'rails_helper'
require_relative '../factories/comentario'

RSpec.describe Comentario, type: :model do
  include FactoryBot::Syntax::Methods
  it 'é válido com conteúdo e post_id presentes' do
    comentario = build(:comentario)
  end

  it 'é inválido sem conteúdo' do
    comentario = build(:comentario, body: nil)
  end

  it 'é inválido sem post_id' do
    comentario = build(:comentario, post_id: nil)
  end

  it 'pertence a um post' do
    associação = described_class.reflect_on_association(:post)
    expect(associação.macro).to eq :belongs_to
  end
end
