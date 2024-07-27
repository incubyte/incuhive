# frozen_string_literal: true

class MakePanelistOrganizationCompulsary < ActiveRecord::Migration[7.0]
  def change
    change_column_null :panelists, :organization_id, false
  end
end
