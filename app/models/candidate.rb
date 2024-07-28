# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :interviews, dependent: :nullify
end
