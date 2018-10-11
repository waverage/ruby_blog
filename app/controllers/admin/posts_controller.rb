class Admin::PostsController < Admin::AdminController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, success: 'Post created'
        else
            flash[:danger] = 'Post not created'
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update_attributes(post_params)
            redirect_to @post, success: 'Post updated'
        else
            flash[:danger] = 'Post not updated'
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, success: 'Post deleted'
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :summary, :body, :image, :category_id, :all_tags)
    end
end