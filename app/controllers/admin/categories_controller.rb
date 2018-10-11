class Admin::CategoriesController < Admin::AdminController
    before_action :set_category, only: [:edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
        @categories = Category.all.order(:name)
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to admin_categories_path, success: 'Категория успешно создана'
        else
            @categories = Category.all.order(:name)
            flash[:danger] = 'Категория не создана'
            render :new
        end
    end

    def edit
        @categories = Category.where("id != #{@category.id}").order(:name)
    end

    def update
        if @category.update_attributes(category_params)
            redirect_to admin_categories_path, success: 'Категория обновлена'
        else
            @categories = Category.where("id != #{@category.id}").order(:name)
            flash[:danger] = 'Категория не обновлена'
            reder :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to admin_categories_path, success: 'Категория удалена'
    end

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :parent_id)
    end
end