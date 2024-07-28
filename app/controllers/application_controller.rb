# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Override Devise's after_sign_in_path_for method
  def after_sign_in_path_for(resource)
    if resource.organization.nil?
      create_or_join_organizations_path
    else
      organization_path(resource.organization)
    end
  end
end
