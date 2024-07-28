# frozen_string_literal: true

FactoryBot.define do
  factory :panelist do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    available_time_slots do
      [Faker::Time.forward(days: 5, period: :morning).strftime('%A %H-%M'),
       Faker::Time.forward(days: 5, period: :afternoon).strftime('%A %H-%M')]
    end
    organization
    expertise { Faker::Job.field }
    bio { Faker::Lorem.paragraph }
  end
end
