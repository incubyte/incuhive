# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :authenticate_panelist!
  before_action :set_organization, only: %i[show update regenerate_invite_code]

  def create_or_join
    redirect_to organization_path(current_panelist.organization) if current_panelist.organization
  end

  def show
    redirect_to root_path unless @organization.panelists.include?(current_panelist)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      current_panelist.update(organization: @organization)
      redirect_to organization_path(@organization), notice: I18n.t('organizations.create.success')
    else
      flash[:alert] = @organization.errors.full_messages.to_sentence
      redirect_to new_organization_path
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_path(@organization), notice: I18n.t('organizations.update.success')
    else
      flash[:alert] = @organization.errors.full_messages.to_sentence
      redirect_to organization_path(@organization)
    end
  end

  def join
    organization = Organization.find_by(invite_code: params[:organization_code])
    if organization
      current_panelist.update(organization: organization)
      redirect_to organization_path(organization), notice: 'Successfully joined the organization.'
    else
      redirect_to create_or_join_organizations_path, alert: 'Invalid organization code.'
    end
  end

  def leave
    current_panelist.update(organization: nil)
    redirect_to create_or_join_organizations_path, notice: 'Successfully left the organization'
  end

  def regenerate_invite_code
    @organization.regenerate_invite_code
    redirect_to organization_path(@organization), notice: I18n.t('organizations.regenerate_invite_code.success')
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
