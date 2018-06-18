require 'rails_helper'

RSpec.describe 'Visit landing page', type: feature do
  let!(:article1) { create(:article) }

  describe 'when visiting front_page' do
    it 'user sees article1' do
      visit '/'

      expect(page).to have_current_path('/')

      expect(page).to have_content article1.title
    end
  end
end
