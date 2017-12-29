require 'rails_helper'

RSpec.describe RailwayStationsController, type: :controller do
  sign_in_user
  let(:railway_station) { create(:railway_station) }

  describe 'GET #index' do
    let(:railway_stations) { create_list(:railway_station, 2) }
    before { get :index }

    it { expect(assigns(:railway_stations)).to match_array railway_stations }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:railway_station)).to be_a_new RailwayStation }
    it { expect(response).to render_template :new }
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

    it { expect(assigns(:railway_station)).to eq railway_station }
    it { expect(response).to render_template :show }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: railway_station } }

    it { expect(assigns(:railway_station)).to eq railway_station }
    it { expect(response).to render_template :edit }
  end

  describe 'PATCH #update' do
    let(:railway_station) { create(:railway_station, title: 'my station') }

    context 'with valid attributes' do
      before do
        patch :update, params: { id: railway_station, railway_station: { title: 'new title' } }
      end

      it { expect(assigns(:railway_station)).to eq railway_station }

      it 'updates attributes of station' do
        railway_station.reload
        expect(railway_station.title).to eq 'new title'
      end

      it { expect(response).to redirect_to railway_station }
    end

    context 'with invalid attributes' do
      before do
        patch :update, params: { id: railway_station, railway_station: { title: nil } }
      end

      it { expect(assigns(:railway_station)).to eq railway_station }

      it 'does not update attributes of station' do
        railway_station.reload
        expect(railway_station.title).to eq 'my station'
      end

      it { expect(response).to render_template :edit }
    end
  end
end
