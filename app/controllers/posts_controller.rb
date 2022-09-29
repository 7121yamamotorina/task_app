class PostsController < ApplicationController

  protect_from_forgery :except => [:destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:id,:title,:start_at,:end_at,:all_day,:memo))
    if @post.save
      flash[:notice] = "新しいスケジュールを登録しました"
      redirect_to :posts
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start_at,:end_at,:all_day,:memo))
    flash[:notice] = "#{@post.id}のスケジュールを変更しました"
    redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
  
end
