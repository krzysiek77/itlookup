# == Schema Information
#
# Table name: ip_addresses
#
# id                      :integer          not null, primary key
# ip                      :string
# name                    :string

class IpAddress < ActiveRecord::Base
  require 'resolv'

  validates :building, presence: true
  validates :hardware_category, presence: true
  validates :ip,
    presence: true,
    uniqueness: true,
    format: { with: Resolv::IPv4::Regex,
              message: ' allows only private ip addresses.'}
  validates :mac,
    format: { with: /\A([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}\z/i,
              message: 'wrong format.' },
    allow_blank: true
  validates :model, presence: true
  validates :name, presence: true
  validates :room, presence: true

  def self.search(search)
    x = search.strip.downcase
    where("ip LIKE :youWantWhat OR name LIKE :youWantWhat", {youWantWhat: "%#{x}%"})
  end

end
