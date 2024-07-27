# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :invite_code, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
