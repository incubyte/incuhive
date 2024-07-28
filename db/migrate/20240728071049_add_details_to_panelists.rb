# frozen_string_literal: true

class AddDetailsToPanelists < ActiveRecord::Migration[7.0]
  def change
    add_column :panelists, :name, :string
    add_column :panelists, :available_time_slots, :string, array: true, default: []
    add_column :panelists, :expertise, :string, array: true, default: []
    add_column :panelists, :bio, :text
  end
end
