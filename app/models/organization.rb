# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :panelists, dependent: :nullify
  has_many :candidates, dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :invite_code, presence: true, uniqueness: true, length: { is: 8 }

  before_validation :generate_invite_code, on: :create

  def regenerate_invite_code
    generate_invite_code
    save!
  end

  private

  def generate_invite_code
    assign_random_invite_code while duplicate_or_invalid_invite_code?
  end

  def assign_random_invite_code
    self.invite_code = SecureRandom.hex(4)
  end

  def duplicate_or_invalid_invite_code?
    invite_code.blank? || Organization.exists?(invite_code: invite_code)
  end
end
