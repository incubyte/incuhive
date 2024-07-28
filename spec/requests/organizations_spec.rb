# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Organizations' do
  context 'when not authenticated' do
    it 'redirects to the sign-in page' do
      get new_organization_path
      expect(response).to redirect_to(new_panelist_session_path)
    end
  end

  context 'when authenticated' do
    let(:panelist) { create(:panelist) }
    let(:organization) { create(:organization) }

    before do
      sign_in panelist
    end

    describe 'GET /organizations/:id' do
      it 'renders the show template' do
        get organization_path(organization)
        expect(response.body).to include('Organization details')
      end

      it 'handles non-existent organization' do
        expect do
          get organization_path(id: 'non-existent-id')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe 'GET /organizations/new' do
      it 'renders the new template' do
        get new_organization_path
        expect(response.body).to include('Create Organization')
      end
    end

    describe 'POST /organizations' do
      it 'redirects to organization show page on success' do
        post organizations_path, params: { organization: { name: 'New Organization' } }
        expect(response).to redirect_to(organization_path(Organization.last))
      end

      it 'creates a new organization successfully' do
        post organizations_path, params: { organization: { name: 'New Organization' } }
        follow_redirect!
        expect(response.body).to include('Organization created successfully')
        expect(Organization.last.name).to eq('New Organization')
      end

      it 'handles non-unique organization name on create' do
        create(:organization, name: 'Existing Name')
        post organizations_path, params: { organization: { name: 'Existing Name' } }
        expect(response).to redirect_to(new_organization_path)
        follow_redirect!
        expect(response.body).to include('Name has already been taken')
      end
    end

    describe 'PATCH /organizations/:id' do
      it 'redirects to organization show page on success' do
        patch organization_path(organization), params: { organization: { name: 'New Name' } }
        expect(response).to redirect_to(organization_path(organization))
      end

      it 'updates the organization name successfully' do
        patch organization_path(organization), params: { organization: { name: 'New Name' } }
        follow_redirect!
        expect(response.body).to include('Organization updated successfully')
        expect(organization.reload.name).to eq('New Name')
      end

      it 'handles non-unique organization name' do
        create(:organization, name: 'Existing Name')
        patch organization_path(organization), params: { organization: { name: 'Existing Name' } }
        expect(response).to redirect_to(organization_path(organization))
        follow_redirect!
        expect(response.body).to include('Name has already been taken')
      end

      it 'handles non-existent organization' do
        expect do
          patch organization_path(id: 'non-existent-id'), params: { organization: { name: 'New Name' } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe 'PATCH /organizations/:id/regenerate_invite_code' do
      it 'redirects to organization show page on success' do
        patch regenerate_invite_code_organization_path(organization)
        expect(response).to redirect_to(organization_path(organization))
      end

      it 'regenerates the invite code successfully' do
        old_invite_code = organization.invite_code
        patch regenerate_invite_code_organization_path(organization)
        follow_redirect!
        expect(response.body).to include('Invite code regenerated successfully')
        expect(organization.reload.invite_code).not_to eq(old_invite_code)
      end

      it 'handles non-existent organization' do
        expect do
          patch regenerate_invite_code_organization_path(id: 'non-existent-id')
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe 'GET /organizations/create_or_join' do
      it 'renders the create_or_join template' do
        get create_or_join_organizations_path
        expect(response.body).to include('Create or Join an Organization')
      end
    end
  end
end
