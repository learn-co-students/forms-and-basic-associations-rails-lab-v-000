class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
# This entire block is phase 1 of the (sort-of) codealong here:
# https://learn.co/tracks/full-stack-web-development-v3/rails/associations-and-rails/forms-and-basic-association
=begin
as a user experience, this is miserable.
I have to know the ID of the category
I want to use. As a user, it is very
unlikely that I know this or want to.

  def create
    Post.create(post_params)
    redirect_to controller: 'posts', action: 'index'
  end
=end


# This entire block is phase 2 of the (sort-of) codealong here:
# https://learn.co/tracks/full-stack-web-development-v3/rails/associations-and-rails/forms-and-basic-association
=begin
  def create
    category = Category.find_or_create_by(name: params[:post][:category_name])
    Post.create(title: params[:post][:title], content: params[:post][:content], category: category)
  end
=end

  def create
    Post.create(post_params)
    redirect_to controller: 'posts', action: 'index'
  end

  private

  def post_params
    params.require(:post).permit(:category_id, :title, :content)
  end
end
