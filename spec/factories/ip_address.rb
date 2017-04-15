require 'faker'

FactoryGirl.define do
  factory :ip_address do
    ip Faker::Internet.private_ip_v4_address
    name 'printer'

    trait :wrong_private_ip do
      ip '192.168.1.500'
    end
  end
end
