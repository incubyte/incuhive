# frozen_string_literal: true

FactoryBot.define do
  factory :interview do
    round { 'MyString' }
    verdict { false }
    feedback { 'MyText' }
    start_time { '2024-07-28 14:58:33' }
  end
end
