# frozen_string_literal: true

class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :current_role
      t.string :applied_role
      t.string :location
      t.integer :total_experience
      t.integer :relevant_experience
      t.string :skills, array: true, default: []
      t.integer :notice_period
      t.string :resume_link
      t.string :linkedin_link
      t.string :github_link
      t.string :repo_link
      t.string :company_name
      t.text :feedback
      t.boolean :offer_given

      t.timestamps
    end
  end
end
