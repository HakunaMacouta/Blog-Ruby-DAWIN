class PostsController < ApplicationController
  before_action :load_user, except: [:index]
  def index
	if(current_user)
	  @posts = Post.all.where(:user_id => current_user.id);
	else
	  @posts = Post.all.order('created_at DESC');
	end
  end
  def new
	@post = Post.new
  end
  def create
	@post = Post.new(post_params)
	@post.user_id = current_user.id
	if @post.save
	  redirect_to [current_user, @post]
	else
	  render 'new'
	end
  end
  def edit
	@post = Post.find(params[:id])
  end
  def update
	@post = Post.find(params[:id])

	if @post.update(post_params)
	  redirect_to user_post_path(current_user, @post)
	else
	  render 'edit'
	end
  end
  def show
	@post = Post.find(params[:id]);
	add_breadcrumb @post.title, [@user, @post]
  end
  def destroy
	if Post.destroy(params[:id])
	  redirect_to user_posts_path(current_user);
	end
  end

  def load_user
	@user = User.find(params[:user_id])
  end

  def post_params
	params.require(:post).permit(:title, :lead, :content, :thumbnail)
  end
end
