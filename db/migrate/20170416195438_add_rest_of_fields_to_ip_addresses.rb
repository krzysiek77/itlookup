class AddRestOfFieldsToIpAddresses < ActiveRecord::Migration
  def change
    add_column :ip_addresses, :building, :string
    add_column :ip_addresses, :room, :string
    add_column :ip_addresses, :mac, :string
    add_column :ip_addresses, :hardware_category, :string
    add_column :ip_addresses, :model, :string
    add_column :ip_addresses, :serial_number, :string
    add_column :ip_addresses, :user, :string
    add_column :ip_addresses, :password, :string
    add_column :ip_addresses, :additional_info, :text
  end
end
