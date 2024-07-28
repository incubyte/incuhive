# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :first_round_panelist, class_name: 'Panelist', optional: true, inverse_of: :first_round_interviews
  belongs_to :second_round_panelist, class_name: 'Panelist', optional: true, inverse_of: :second_round_interviews
  belongs_to :third_round_panelist, class_name: 'Panelist', optional: true, inverse_of: :third_round_interviews
  belongs_to :final_round_panelist, class_name: 'Panelist', optional: true, inverse_of: :final_round_interviews

  has_one :candidate, dependent: :nullify
end
