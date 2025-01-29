class Api::V1::PositionsController < ApplicationController
  include ErrorFormatter
  before_action :get_position, only: [ :show, :update, :destroy ]

  # GET /positions
  def index
    @positions = Position.order(:id)

    render json: { status: "Success", data: ActiveModelSerializers::SerializableResource.new(@positions, each_serializer: PositionSerializer) }
  end

  # GET /positions/:id
  def show
    render json: { status: "Success", data: PositionSerializer.new(@position) }
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: { status: "Success", message: "Position was added successfully.", data: PositionSerializer.new(@position) }, status: :created
    else
      render json: { status: "Error", message: format_errors(@position.errors) }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /positions/:id
  def update
    if @position.update(position_params)
      render json: { status: "Success", message: "Position was updated successfully." }, status: :ok
    else
      render json: { status: "Error", message: format_errors(@position.errors) }, status: :unprocessable_entity
    end
  end

  def destroy
    if @position.destroy
      render json: { status: "Success", message: "Position was deleted successfully." }, status: :ok
    else
      render json: { status: "Error",  messages: "Failed to delete position" }, status: :unprocessable_entity
    end
  end

  private

  def get_position
    @position = Position.find_by(id: params[:id])
    unless @position
      render json: { status: "Error", message: "Position not found" }, status: :not_found
    end
  end

  def position_params
    params.require(:position).permit(:position_title, :salary)
  end

  
end
