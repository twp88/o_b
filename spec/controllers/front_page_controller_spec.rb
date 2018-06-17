require 'rails_helper'

RSpec.describe FrontPageController, type: :controller do
  let(:article1) { create(:article) }

  context 'when index action accessed' do
    it 'returns all articles' do
      get :index

      expect(assigns(:articles)).to eq [article1]
    end
  end
end
