# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show update regenerate_invite_code]

  def show; end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to new_organization_path, notice: 'Organization created successfully.'
    else
      flash[:alert] = @organization.errors.full_messages.to_sentence
      redirect_to new_organization_path
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_path(@organization), notice: 'Organization updated successfully.'
    else
      flash[:alert] = @organization.errors.full_messages.to_sentence
      redirect_to organization_path(@organization)
    end
  end

  def regenerate_invite_code
    @organization.regenerate_invite_code
    redirect_to organization_path(@organization), notice: 'Invite code regenerated successfully.'
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
