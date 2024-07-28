# frozen_string_literal: true

class AddAdminToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_reference :organizations, :admin, null: true, foreign_key: { to_table: :panelists }
  end
end
