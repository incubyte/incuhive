# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb' do
  before do
    render
  end

  it { expect(rendered).to have_content('Welcome to Incuhive') }
  it { expect(rendered).to have_content('Streamlining the hiring process for your team') }

  it 'displays the call-to-action button' do
    expect(rendered).to have_button('Get Started')
  end

  it 'displays the feature section' do
    expect(rendered).to have_content('Why Choose Incuhive?')
    expect(rendered).to have_css('.feature', count: 2)
  end

  it 'displays the feature description for feature 1' do
    expect(rendered).to have_content('Easy to use')
    expect(rendered).to have_content('Anyone can use Incuhive, no training necessary')
  end

  it 'displays the feature description for feature 2' do
    expect(rendered).to have_content('Excel Interop')
    expect(rendered).to have_content('Incuhive can both import and export to excel')
  end

  it 'ensures feature cards have equal height using inline styles' do
    rendered_height_styles = Nokogiri::HTML(rendered).css('.feature').pluck('style')
    expect(rendered_height_styles.uniq.size).to eq(1)
  end
end
