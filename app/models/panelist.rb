# frozen_string_literal: true

class Panelist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization, dependent: nil, optional: true

  has_many :interviews, dependent: :nullify
  has_many :first_round_interviews,
           class_name: 'Interview',
           foreign_key: 'first_round_panelist_id',
           dependent: :nullify,
           inverse_of: :first_round_panelist

  has_many :second_round_interviews,
           class_name: 'Interview',
           foreign_key: 'second_round_panelist_id',
           dependent: :nullify,
           inverse_of: :second_round_panelist

  has_many :third_round_interviews,
           class_name: 'Interview',
           foreign_key: 'third_round_panelist_id',
           dependent: :nullify,
           inverse_of: :third_round_panelist

  has_many :final_round_interviews,
           class_name: 'interview',
           foreign_key: 'final_round_panelist_id',
           dependent: :nullify,
           inverse_of: :final_round_panelist

  validates :email, presence: true, uniqueness: true
end
