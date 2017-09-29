class PostsController < ApplicationController
	http_basic_authenticate_with name: "Geoffrey", password:"1234", except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new

	end

	def create
	    @post = Post.new(permit_post)

	    if@post.save
	    	flash[:success] = "success!"
	       redirect_to post_path(@post)
	    else
	    	flash[:error] = @post.errors.full_messages
	    	rendirect_ro new_post_path
	    end
	end

	def edit
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])

		 if(@post.update(post_params))
	       redirect_to @post
	    else
	    	render 'edit'
	    end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end

	private def permit_post
	  params.require(:post).permit(:title, :body, :image)
	end



end
