class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category_id = params[:id]
    category = Category.find(category_id)
    render json: category
  end

  def create
    category = Category.new(
      category: params[:category],
      user_id: current_user.id,
    )
    if current_user
      if category.save
        render json: category
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    category_id = params[:id]
    category = Category.find(category_id)

    category.category = params[:category] || category.category

    if category.save
      render json: category
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    category_id = params[:id]
    category = Category.find(category_id)
    category.destroy

    render json: { message: "category successfully deleted" }
  end
end
