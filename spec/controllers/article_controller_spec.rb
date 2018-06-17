require 'rails_helper'

RSpec.describe ArticleController, type: :controller do
  let!(:article1) { create(:article) }
  let!(:article2) { create(:article) }

  describe 'when show action is called' do
    it 'returns correct article' do
      get :show, params: { id: article1.id }

      expect(assigns(:article)).to eq article1
    end
  end
end
