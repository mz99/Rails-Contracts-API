class ContractsController < ApplicationController
  before_action :authenticate_user
  
  def show
    if @current_user.contracts.find_by(id: params[:id])
      render json: @current_user.contracts.find_by(id: params[:id])
    else
      render json: { error: "Contract not found"}, status: 400
    end
  end

  def create
    contract = @current_user.contracts.build(contract_params)
    if contract.save
      render json: contract
    else
      render json: { error: contract.errors }, status: 400
    end
  end

  def destroy
    contract = @current_user.contracts.find_by(id: params[:id])
    if @current_user.contracts.destroy(contract)
      render json: { success: "Contract successfully deleted" } , status: 204
    else
      render json: { error: "Contract not found" }, status: 400
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:vendor, :starts_on, :ends_on, :price)
  end
end
