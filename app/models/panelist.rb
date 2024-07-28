# frozen_string_literal: true

class Panelist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization, dependent: nil, optional: true
  has_many :interviews, dependent: :nullify

  validates :email, presence: true, uniqueness: true
end
