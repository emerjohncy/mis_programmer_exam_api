class Api::V1::EmployeeCompaniesController < ApplicationController
  include ErrorFormatter
  before_action :get_employee_company, only: [ :show, :update, :destroy ]

  # GET /employee_companies
  def index
    @employee_companies = EmployeeCompany.order(:id)

    render json: { status: "Success", data: ActiveModelSerializers::SerializableResource.new(@employee_companies, each_serializer: EmployeeCompanySerializer) }
  end

  # GET /employee_companies/:id
  def show
    render json: { status: "Success", data: EmployeeCompanySerializer.new(@employee_company) }
  end

  # POST /employee_companies
  def create
    @employee_company = EmployeeCompany.new(employee_company_params)

    if @employee_company.save
      render json: { status: "Success", message: "Employee-Company record was added successfully.", data: EmployeeCompanySerializer.new(@employee_company) }, status: :created
    else
      render json: { status: "Error", message: format_errors(@employee_company.errors) }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /employee_companies/:id
  def update
    if @employee_company.update(employee_company_params)
      render json: { status: "Success", message: "Employee-Company record was updated successfully." }, status: :ok
    else
      render json: { status: "Error", message: format_errors(@employee_company.errors) }, status: :unprocessable_entity
    end
  end

  # DELETE /employee_companies/:id
  def destroy
    if @employee_company.destroy
      render json: { status: "Success", message: "Employee-Company record was deleted successfully." }, status: :ok
    else
      render json: { status: "Error",  message: "Failed to delete employee-company record" }, status: :unprocessable_entity
    end
  end

  private

  def get_employee_company
    @employee_company = EmployeeCompany.find_by(id: params[:id])
    unless @employee_company
      render json: { status: "Error", message: "Employee-Company record not found" }, status: :not_found
    end
  end

  def employee_company_params
    params.require(:employee_company).permit(:employee_id, :company_id)
  end
end