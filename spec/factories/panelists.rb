# frozen_string_literal: true

FactoryBot.define do
  factory :panelist do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
