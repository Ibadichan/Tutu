require 'rails_helper'

RSpec.describe TrainsController, type: :controller do
  sign_in_user

  describe 'GET #index' do
    let(:trains) { create_list(:train, 2) }
    before { get :index }

    it { expect(assigns(:trains)).to match_array trains }
    it { expect(response).to render_template :index }
  end
end
