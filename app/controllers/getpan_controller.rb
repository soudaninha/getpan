class GetpanController < ApplicationController
  
  def logged_in?
    unless user_signed_in?
      redirect_to '/login'
    end
  end
    
  before_filter :logged_in?
  def write
  end
  
  def create
    Post.create!(user_id: params[:user_id], title: params[:title], content: params[:content])
    redirect_to '/getpan/write'
  end
  
  def update
    @one_post = Post.find(params[:id])
    @one_post.title = params[:title]
    @one_post.content = params[:content]
    @one_post.save
    redirect_to :back
  end
  
  def destroy
    @des = Post.find(params[:id])
    @des.destroy
    redirect_to '/getpan/write'
  end
  
  def destroybyadmin
    @des = Post.find(params[:id])
    @des.destroy
    redirect_to :back
  end
  
  # 글 만들고 지우기
  
  def add_reply
    Reply.create!(post_id: params[:post_id], content: params[:content])
    redirect_to :back
  end
  
  def destroy_reply
    @des = Reply.find(params[:id])
    @des.destroy
    redirect_to :back
  end
  
  # 댓글 만들고 지우기
  
  def admin?
    unless current_user.id == 1
      redirect_to '/getpan/error'
    end
  end
    
  before_filter :admin?, :only => [:admin]
  def admin
      @allpost = Post.all
      @alluser = User.all
  end

  def user
    @allpost = Post.all
  end
  
  def page
    @one_post = Post.find(params[:id])
  end

  def error
  end
end
