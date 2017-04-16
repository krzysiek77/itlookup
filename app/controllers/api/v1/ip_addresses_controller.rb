class Api::V1::IpAddressesController < Api::V1::BaseController
  def index
    respond_with IpAddress.all.order(:ip)
  end

  def create
    ip_address = IpAddress.new(ip_address_params)
    if ip_address.save
      render json: ip_address, status: 201
    else
      render json: { errors: ip_address.errors }, status: 422
    end
  end

  def destroy
    respond_with :api, :v1, IpAddress.destroy(params[:id])
  end

  def update
    ip_address = IpAddress.find(params[:id])
    ip_address.update_attributes(ip_address_params)
    respond_with ip_address, json: ip_address
  end

  private
    def ip_address_params
      params.require(:ip_address).permit(:id, :ip, :name, :hardware_category, :mac,
        :building, :room, :model, :serial_number, :user, :password, :additional_info)
    end
end
