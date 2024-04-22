class AccountsController < ApplicationController
  before_action :authenticate_user!

  def user_details
    @user = current_user
    @post = Post.where(user_id: @user.id)
    @post_count = @post.count
    @comentarios_count =  Comentario.where(user_id: @user.id).count
  end

  def posts_details
    @posts = Post.where(user_id: current_user.id).order("created_at DESC")
    search = params[:search]
    tags = Tag.where("nome ILIKE ?", "%#{search}%").pluck(:id) if search.present?
    @posts = @posts.tag_ids(tags) if tags.present?
    @posts = @posts.paginate(page: params[:page], per_page: 3)
  end
end
