# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Panelist do
  subject { build(:panelist) }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:encrypted_password) }
end
