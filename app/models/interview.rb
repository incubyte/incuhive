# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :panelist, dependent: :nullify
  belongs_to :candidate, dependent: :nullify
end
