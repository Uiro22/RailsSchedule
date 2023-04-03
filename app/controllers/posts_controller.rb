class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(
      :title,
      :startdate,
      :enddate,
      :allday,
      :memo,
    ))
    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to :posts
    else
      flash.now[:failure] = "投稿を作成できませんでした"
      render :new, status: :unprocessable_entity
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
    if @post.update(params.require(:post).permit(
      :title,
      :startdate,
      :enddate,
      :allday,
      :memo,
    ))
    flash[:success] = "編集できました"
    redirect_to :posts
     else
      flash.now[:failure] = "編集できませんでした"
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    @post = Post.find(params[:id])
     @post.destroy
     flash[:delete] = "スケジュールを削除しました"
     redirect_to :posts
  end

end
