class Api::V1::IpAddressesController < Api::V1::BaseController
  def index
    respond_with IpAddress.all
  end
end
