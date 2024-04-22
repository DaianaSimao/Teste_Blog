class HomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")

    search = params[:search]
    tags = Tag.where("nome ILIKE ?", "%#{search}%").pluck(:id)
    posts = TagPost.where(tag_id: tags).map(&:post) if tags.present?
    @posts = Post.where(id: posts.pluck(:id)).order("created_at DESC") if posts.present?
    @posts = @posts.paginate(page: params[:page], per_page: 3)

    @top_tags = Tag.joins(:tag_posts).group(:id).order("count(tag_id) DESC").limit(6)
  end

  def search_suggestions
    searchText = params[:search]
    suggestions = Tag.where("nome ILIKE ?", "%#{searchText}%").pluck(:nome)
    render json: suggestions
  end
end
