# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb' do
  before do
    render
  end

  it { expect(rendered).to have_content('Welcome to Incuhive') }
  it { expect(rendered).to have_content('Streamlining the hiring process for your team') }

  it { expect(rendered).to have_content('Why Choose Incuhive?') }

  context 'when panelist is signed in' do
    before do
      panelist_double = instance_double(Panelist, email: 'test@example.com')
      allow(view).to receive_messages(
        panelist_signed_in?: true,
        current_panelist: panelist_double
      )
      render
    end

    it 'greets the signed-in panelist' do
      expect(rendered).to have_content('Welcome test@example.com')
    end

    it 'shows the sign out button' do
      expect(rendered).to have_button('Sign out')
    end
  end

  context 'when panelist is not signed in' do
    before do
      allow(view).to receive(:panelist_signed_in?).and_return(false)
      render
    end

    it 'shows the get started button' do
      expect(rendered).to have_button('Get Started')
    end

    it 'does not show the sign out button' do
      expect(rendered).to have_no_button('Sign out')
    end
  end

  it 'displays the feature description for feature 1' do
    expect(rendered).to have_content('Easy to use')
    expect(rendered).to have_content('Anyone can use Incuhive, no training necessary')
  end

  it 'displays the feature description for feature 2' do
    expect(rendered).to have_content('Excel Interop')
    expect(rendered).to have_content('Incuhive can both import and export to Excel')
  end
end
