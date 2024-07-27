# frozen_string_literal: true

class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.invite_code = generate_invite_code
    if @organization.save
      flash[:notice] = "Organization created successfully."
      redirect_to new_organization_path
    else
      flash[:alert] = "Error creating organization."
      render new_organization_path
    end
  rescue ActiveRecord::RecordNotUnique
    flash[:alert] = "Organization name must be unique."
    redirect_to new_organization_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def generate_invite_code
    SecureRandom.hex(10)
  end
end