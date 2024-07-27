# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { 'Test Organization' }
    invite_code { SecureRandom.hex(10) }
  end
end
