class Tag < ApplicationRecord
  has_many :tag_posts, dependent: :destroy
  validates :nome, presence: true, uniqueness: true
  before_save :capitalize_name

  def capitalize_name
    self.nome = self.nome.capitalize
  end

  def salvar_tags(tags)
    tags_post = []
    tags_names = tags.split(",").map(&:strip)
    tags_names.each do |tag_name|
      tag = Tag.where("nome ILIKE ?", "%#{tag_name}%").first
      if tag.nil?
        tag = Tag.create(nome: tag_name.strip)
        tags_post << tag.id
      else 
        tags_post << tag.id
      end
    end
    tags_post
  end
end
