class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheeses = Cheese.find_by(id: params[:id])
    if cheeses
      render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
    else
      render json: {error: "Could not find that cheese!"}, status: :not_found
    end
  end

end
