# frozen_string_literal: true

json.extract! candidate, :id, :name, :email, :current_role, :applied_role, :location, :total_experience,
              :relevant_experience, :skills, :notice_period, :resume_link, :linkedin_link, :github_link, :repo_link, :company_name, :feedback, :offer_given, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
