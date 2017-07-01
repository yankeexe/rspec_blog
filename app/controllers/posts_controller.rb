class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]

def index
	@posts = Post.all
end

def show
	
end

def new 
	@post = Post.new
end

def create
	@post = Post.create(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :new
		end
end

def edit 
end

def update
	@post.update(post_params)
	if @post.valid?
		redirect_to root_path
	else
		render :edit
	end
end

def destroy
	@post.destroy
	redirect_to root_path
end

private

def find_post
	@post = Post.find(params[:id])
end

def post_params
	params.require(:post).permit(:title, :author, :content)
end

end
