# frozen_string_literal: true

class AddReferencesForInterview < ActiveRecord::Migration[7.0]
  def change
    add_reference :interviews, :panelist, null: false, foreign_key: true
    add_reference :interviews, :candidate, null: false, foreign_key: true

    change_column :interviews, :start_time, :datetime, null: false
  end
end
