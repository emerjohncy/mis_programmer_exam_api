class Api::V1::EmployeesController < ApplicationController
  include ErrorFormatter
  before_action :get_employee, only: [ :show, :update, :destroy ]

  # GET /employees
  def index
    if params[:without_company] == 'true'
      @employees = Employee.without_company.order(:employee_number)
    else
      @employees = Employee.order(:employee_number)
    end

    render json: { status: "Success", data: ActiveModelSerializers::SerializableResource.new(@employees, each_serializer: EmployeeSerializer) }
  end

  # GET /employees/:id
  def show
    render json: { status: "Success", data: EmployeeSerializer.new(@employee) }
  end

  # POST /employess
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: { status: "Success", message: "Employee was added successfully.", data: EmployeeSerializer.new(@employee) }, status: :created
    else
      render json: { status: "Error", message: format_errors(@employee.errors) }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /employees/:id
  def update
    if @employee.update(employee_params)
      render json: { status: "Success", message: "Employee was updated successfully." }, status: :ok
    else
      render json: { status: "Error", message: format_errors(@employee.errors) }, status: :unprocessable_entity
    end
  end

  # DELETE /employees/:id
  def destroy
    if @employee.destroy
      render json: { status: "Success", message: "Employee was deleted successfully." }, status: :ok
    else
      render json: { status: "Error",  message: "Failed to delete employee" }, status: :unprocessable_entity
    end
  end

  private

  def get_employee
    @employee = Employee.find_by(id: params[:id])
    unless @employee
      render json: { status: "Error", message: "Employee not found" }, status: :not_found
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :middle_name, :position_id)
  end
end
