class BlogsController < ApplicationController
	def index
	  @blogs = Blog.all
	end

	def show 
	  @blog = Blog.find(params[:id])
	end 

	def new 
	  @blog = Blog.new
	end

	def create
	  @blog = Blog.new
	  @blog.title = params[:blog][:title]
	  @blog.body = params[:blog][:body]
	  @blog.save
	  redirect_to blog_path(@blog)
	end

	def destroy
	 @blog = Blog.find params[:id]
	 @blog.destroy
	 redirect_to blogs_path
	end

	def edit
	 @blog = Blog.find(params[:id])

	end

	def update
	   @blog = Blog.find params[:id]
	   @blog = @blog.update blog_params 
	   redirect_to blog_path
	  end


	 def blog_params
			params.require(:blog).permit(:title, :body)
		end
	end 

