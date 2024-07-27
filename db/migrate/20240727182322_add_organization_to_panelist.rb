# frozen_string_literal: true

class AddOrganizationToPanelist < ActiveRecord::Migration[7.0]
  def change
    add_reference :panelists, :organization, null: true, foreign_key: true

    reversible do |dir|
      dir.up do
        # Ensure that all existing panelists are associated with the first organization
        organization = Organization.find_or_create_by!(name: 'Default Organization')
        Panelist.update_all(organization_id: organization.id)
      end
    end
  end
end
