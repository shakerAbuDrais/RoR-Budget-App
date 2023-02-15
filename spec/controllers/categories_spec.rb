require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    context 'when user is logged in' do
      let(:user) { create(:user) }
      before { sign_in user }

      it 'assigns categories to current user' do
        category = create(:category, user: user)
        get :index
        expect(assigns(:categories)).to eq([category])
      end
    end
  end
end
