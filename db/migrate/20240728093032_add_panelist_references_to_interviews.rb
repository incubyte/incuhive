# frozen_string_literal: true

class AddPanelistReferencesToInterviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :interviews, :first_round_panelist, null: true, foreign_key: { to_table: :panelists }
    add_reference :interviews, :second_round_panelist, null: true, foreign_key: { to_table: :panelists }
    add_reference :interviews, :third_round_panelist, null: true, foreign_key: { to_table: :panelists }
    add_reference :interviews, :final_round_panelist, null: true, foreign_key: { to_table: :panelists }
  end
end
