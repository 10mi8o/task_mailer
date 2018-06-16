class BlogsController < ApplicationController

  before_action :logged_in_user, only:[:new, :show,:edit,:update,:destroy]
  before_action :get_blog, only:[:show,:edit,:update,:destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
        @blog = Blog.new(blog_params)
      else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path, notice: "ブログを作成しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログの編集をしました"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:'ブログの削除に成功しました'
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:content)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "loginしてください"
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end
