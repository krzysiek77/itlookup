# == Schema Information
#
# Table name: ip_addresses
#
# id                      :integer          not null, primary key
# ip                      :string
# name                    :string

class IpAddress < ActiveRecord::Base
  require 'resolv'
  
  validates :ip,
    presence: true,
    uniqueness: true,
    format: { :with => Resolv::IPv4::Regex }
  validates :name, presence: true
end
