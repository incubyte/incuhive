# frozen_string_literal: true

class AddOrganizationToPanelist < ActiveRecord::Migration[7.0]
  def change
    add_reference :panelists, :organization, null: true, foreign_key: true
  end
end
