# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization do
  context 'when creating a new organization in database' do
    it 'validates the presence of name' do
      organization = described_class.new
      expect(organization).not_to be_valid
      expect(organization.errors[:name]).to include("can't be blank")
    end

    it 'validates the uniqueness of name' do
      described_class.create(name: 'Test Organization')
      organization = described_class.new(name: 'Test Organization')
      expect(organization).not_to be_valid
      expect(organization.errors[:name]).to include('has already been taken')
    end

    it 'generates an invite code' do
      organization = described_class.create(name: 'Test Organization')
      expect(organization.invite_code).to be_present
    end

    it 'generates a unique invite code' do
      organization1 = described_class.create(name: 'Test Organization 1')
      organization2 = described_class.create(name: 'Test Organization 2', invite_code: organization1.invite_code)
      expect(organization1.invite_code).not_to eq(organization2.invite_code)
    end
  end

  context 'when creating new organization instance' do
    it 'does not generate invite code during initialization' do
      organization = described_class.new(name: 'Test Organization')
      expect(organization.invite_code).to be_nil
    end

    it 'generates an invite code when validating' do
      organization = described_class.new(name: 'Test Organization')
      expect(organization).to be_valid
      expect(organization.invite_code).to be_present
    end

    it 'regenerates an invite code if it is not unique' do
      organization1 = described_class.create(name: 'Test Organization 1')
      organization2 = described_class.new(name: 'Test Organization 2', invite_code: organization1.invite_code)

      expect(organization2).to be_valid

      expect(organization2.invite_code).not_to eq(organization1.invite_code)
    end
  end

  context 'when regenerating invite code' do
    it 'assigns a random invite code' do
      organization = described_class.create(name: 'Test Organization')
      initial_invite_code = organization.invite_code
      organization.regenerate_invite_code

      expect(organization.invite_code).not_to eq(initial_invite_code)
    end
  end
end
