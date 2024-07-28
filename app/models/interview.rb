# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :panelist
  belongs_to :candidate
end
