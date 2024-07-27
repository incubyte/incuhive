# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb' do
  before do
    render
  end

  it { expect(rendered).to have_content('Welcome to Incuhive') }
  it { expect(rendered).to have_content('Streamlining the hiring process for your team') }

  it { expect(rendered).to have_content('Why Choose Incuhive?') }
  it { expect(rendered).to have_button('Get Started') }

  it 'displays the feature description for feature 1' do
    expect(rendered).to have_content('Easy to use')
    expect(rendered).to have_content('Anyone can use Incuhive, no training necessary')
  end

  it 'displays the feature description for feature 2' do
    expect(rendered).to have_content('Excel Interop')
    expect(rendered).to have_content('Incuhive can both import and export to Excel')
  end
end
