# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :organization, only: %i[show update regenerate_invite_code]

  def new
    @organization = Organization.new
  end

  def show
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

  def update
    if @organization.update(organization_params)
      flash[:notice] = "Organization updated successfully."
    else
      flash[:alert] = "Error updating organization."
    end
    redirect_to organization_path(@organization)
  rescue ActiveRecord::RecordNotUnique
    flash[:alert] = "Organization name must be unique."
    redirect_to organization_path(@organization)
  end

  def regenerate_invite_code
    @organization.update(invite_code: generate_invite_code)
    flash[:notice] = "Invite code regenerated successfully."
    redirect_to organization_path(@organization)
  end

  private

  def organization
    @organization ||= Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end

  def generate_invite_code
    SecureRandom.hex(10)
  end
end