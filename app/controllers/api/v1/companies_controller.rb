class Api::V1::CompaniesController < ApplicationController
  include ErrorFormatter
  before_action :get_company, only: [ :show, :update, :destroy ]

  # GET /companies
  def index
    @companies = Company.order(:id)

    render json: { status: "Success", data: ActiveModelSerializers::SerializableResource.new(@companies, each_serializer: CompanySerializer) }
  end

  # GET /companies/:id
  def show
    render json: { status: "Success", data: CompanySerializer.new(@company) }
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: { status: "Success", message: "Company was created successfully.", data: CompanySerializer.new(@company) }, status: :created
    else
      render json: { status: "Error", message: format_errors(@company.errors) }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /companies/:id
  def update
    if @company.update(company_params)
      render json: { status: "Success", message: "Company was updated successfully." }, status: :ok
    else
      render json: { status: "Error", message: format_errors(@company.errors) }, status: :unprocessable_entity
    end
  end

  def destroy
    if @company.destroy
      render json: { status: "Success", message: "Company was deleted successfully." }, status: :ok
    else
      render json: { status: "Error",  messages: "Failed to delete company" }, status: :unprocessable_entity
    end
  end

  private

  def get_company
    @company = Company.find_by(id: params[:id])
    unless @company
      render json: { status: "Error", message: "Company not found" }, status: :not_found
    end
  end

  def company_params
    params.require(:company).permit(:company_name, :company_email, :company_address)
  end
end
