# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :interviews, dependent: :nullify

  belongs_to :organization

  validates :email, presence: true, uniqueness: true
end
