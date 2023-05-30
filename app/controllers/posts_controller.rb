class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    # new_post_pathというPrefixを書くことで、"/blogs/new"というURLの指定をします、という意味になる。
    #一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to new_post_path, notice: "つぶやき作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(pot_params)
      redirect_to posts_path, notice: "つぶやき編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "つぶやき削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end