# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :interviews, dependent: :nullify

  belongs_to :organization, dependent: :nullify
end
