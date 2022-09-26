class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at]
    #render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
    render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else 
      render json: { error: 'cheese not found' }, status: :not_found
    end
    #render json: cheese, only: [:id, :name, :price, :is_best_seller]
    # render json: {
    #   id: cheese.id,
    #   name: cheese.name,
    #   price: cheese.price,
    #   is_best_seller: cheese.is_best_seller
    # }
  end

end
