require 'rails_helper'

RSpec.describe RailwayStationsController, type: :controller do
  sign_in_user

  describe 'GET #index' do
    let(:railway_stations) { create_list(:railway_station, 2) }

    before { get :index }

    it 'populates array of all railway stations' do
      expect(assigns(:railway_stations)).to match_array railway_stations
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end
  end
end
