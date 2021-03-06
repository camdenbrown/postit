class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_user, except: [:index, :show]

 def index
   @categories = Category.all
 end

 def show

 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.create(category_params)

   if @category.save
     flash[:notice] = "A new category has been added."
     redirect_to root_path
   else
     render :new
   end
 end

 private

 def category_params
   params.require(:category).permit(:name)
 end

  def set_category
    @category = Category.find(params[:id])
  end
end
