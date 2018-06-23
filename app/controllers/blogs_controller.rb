class BlogsController < ApplicationController

  before_action :logged_in_user, only:[:new, :show,:edit,:update,:destroy]
  before_action :get_blog, only:[:show,:edit,:update,:destroy]
  # add 以下Task_mailerの為、追記
  # before_action :set_posted, only: [:show, :edit, :update, :destroy]

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
    @blog.user_id = current_user.id

    # add 以下Task_mailerの為、追記

    if @blog.save
      UserMailer.create_blog_mail(@blog).deliver
      redirect_to blogs_path, notice: "ブログを作成しました"
      else
        render 'new'
      end
    end

    #origin

    # @blog.user_id = current_user.id
    # if @blog.save
    #   redirect_to new_blog_path, notice: "ブログを作成しました"
    # else
    #   render 'new'
    # end
  # end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
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
    @blog.user_id = current_user.id
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

  # add 以下Task_mailerの為、追記
  # def set_posted
  #   @posted_user = Blog.find(params[:id])
  # end
end
