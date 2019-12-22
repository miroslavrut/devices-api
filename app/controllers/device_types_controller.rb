class DeviceTypesController < ApplicationController
  def index
    render json: DeviceType.all
  end

  def show
    render json: DeviceType.find(params[:id])
  end

  def create
    device_type = DeviceType.new(device_type_params)
    if device_type.save
      render json: device_type
    else
      # return 422 status code
      render json: device_type.errors.to_a, status: :unprocessable_entity
    end
  end

  def update
    device_type = DeviceType.find(params[:id])
    if device_type.update_attributes(device_type_params)
      render json: device_type
    else
      # return 422 status code
      render json: device_type.errors.to_a, status: :unprocessable_entity
    end
  end

  def destroy
    device_type = DeviceType.find(params[:id])
    device_type.destroy
    # destroy returns object that was deleted from db
    # reconsider this
    render json: device_type
  end

  private

  # Protection from end-user assignment
  def device_type_params
    params.require(:device_type).permit(:name, :parent_id)
  end
end