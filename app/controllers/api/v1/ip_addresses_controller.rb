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

  private
    def ip_address_params
      params.require(:ip_address).permit(:id, :ip, :name)
    end
end
