# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    invite_code { SecureRandom.hex(4) }
  end
end
