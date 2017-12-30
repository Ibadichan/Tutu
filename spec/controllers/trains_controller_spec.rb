require 'rails_helper'

RSpec.describe TrainsController, type: :controller do
  sign_in_user
  let(:train) { create(:train) }

  describe 'GET #index' do
    let(:trains) { create_list(:train, 2) }
    before { get :index }

    it { expect(assigns(:trains)).to match_array trains }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:train)).to be_a_new Train }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new train' do
        expect do
          post :create, params: { train: attributes_for(:train) }
        end.to change(Train, :count).by(1)
      end

      it 'redirects to created train' do
        post :create, params: { train: attributes_for(:train) }
        expect(response).to redirect_to assigns(:train)
      end
    end

    context 'with invalid attributes' do
      it 'does not create train' do
        expect do
          post :create, params: { train: attributes_for(:invalid_train) }
        end.to_not change(Train, :count)
      end

      it 'renders new template' do
        post :create, params: { train: attributes_for(:invalid_train) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: train } }

    it { expect(assigns(:train)).to eq train }
    it { expect(response).to render_template :show }
  end
end
