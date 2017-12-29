require 'rails_helper'

RSpec.describe RailwayStationsController, type: :controller do
  sign_in_user
  let(:railway_station) { create(:railway_station) }

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

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new station to @railway_station' do
      expect(assigns(:railway_station)).to be_a_new RailwayStation
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'attributes are valid' do
      it 'creates a new railway station' do
        expect do
          post :create, params: { railway_station: attributes_for(:railway_station) }
        end.to change(RailwayStation, :count).by(1)
      end

      it 'redirects to created railway station' do
        post :create, params: { railway_station: attributes_for(:railway_station) }
        expect(response).to redirect_to assigns(:railway_station)
      end
    end

    context 'attributes are invalid' do
      it 'does not create railway station' do
        expect do
          post :create, params: { railway_station: attributes_for(:invalid_railway_station) }
        end.to_not change(RailwayStation, :count)
      end

      it 'renders new template' do
        post :create, params: { railway_station: attributes_for(:invalid_railway_station) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: railway_station } }

    it 'assigns the requested station to @railway_station' do
      expect(assigns(:railway_station)).to eq railway_station
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end
end
