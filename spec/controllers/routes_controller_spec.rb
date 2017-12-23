require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  sign_in_user

  describe 'GET #index' do
    let(:routes) { create_list(:route, 2) }

    before { get :index }

    it 'populates array of all routes' do
      expect(assigns(:routes)).to eq routes
    end

    it 'renders template index' do
      expect(response).to render_template :index
    end
  end
end
