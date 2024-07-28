# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.string :round
      t.boolean :verdict
      t.text :feedback
      t.datetime :start_time

      t.timestamps
    end
  end
end
