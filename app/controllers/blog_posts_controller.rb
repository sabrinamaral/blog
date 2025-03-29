class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]
  before_action :set_blog_post, only: [ :show, :edit, :update, :destroy ]
  before_action :show_navbar
  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Category updated successfully."
    else
      render :edit, status: :unprocessable_entity, alert: "Failed to update category."
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private
def blog_post_params
  params.required(:blog_post).permit(:title, :body, :category)
end

def set_blog_post
  @blog_post = BlogPost.find(params[:id])
rescue ActiveRecord::RecordNotFound
  redirect_to root_path
end

def show_navbar
  @show_navbar = true
end
end
