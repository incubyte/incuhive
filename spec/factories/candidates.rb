# frozen_string_literal: true

FactoryBot.define do
  factory :candidate do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    current_role { 'MyString' }
    applied_role { 'MyString' }
    location { 'MyString' }
    total_experience { 1 }
    relevant_experience { 1 }
    skills { ['MyString'] }
    notice_period { 1 }
    resume_link { 'MyString' }
    linkedin_link { 'MyString' }
    github_link { 'MyString' }
    repo_link { 'MyString' }
    company_name { 'MyString' }
    feedback { 'MyText' }
    offer_given { false }

    organization
  end
end
