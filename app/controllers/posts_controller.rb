class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end


  def create
    # メモ作成時に未読の情報を保存する
    post = Post.create(content: params[:content])
    # レスポンスをjsonにする（データ形式）
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else 
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end

end