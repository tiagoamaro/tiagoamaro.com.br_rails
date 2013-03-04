class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.order(:updated_at).page(params[:page])

    respond_to do |format|
      format.html
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /posts/new
  def new
    @post = Post.new

    respond_to do |format|
      format.html
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end
end
