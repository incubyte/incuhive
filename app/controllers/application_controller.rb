# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Override Devise's after_sign_in_path_for method
  def after_sign_in_path_for(_resource)
    create_or_join_organizations_path
  end
end
