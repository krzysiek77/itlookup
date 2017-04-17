require 'faker'

FactoryGirl.define do
  factory :ip_address do
    ip { Faker::Internet.private_ip_v4_address }
    name 'printer'
    building '1'
    room 'sales office'
    hardware_category 'printer'
    model 'HP 001'
    mac { Faker::Internet.mac_address }

    trait :wrong_private_ip do
      ip '192.168.1.500'
    end

    trait :wrong_mac_address do
      mac 'abcdefg'
    end
  end
end
