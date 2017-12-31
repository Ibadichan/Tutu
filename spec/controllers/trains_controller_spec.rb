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

  describe 'GET #edit' do
    before { get :edit, params: { id: train } }

    it { expect(assigns(:train)).to eq train }
    it { expect(response).to render_template :edit }
  end

  describe 'PATCH #update' do
    let(:train) { create(:train, number: 'my number') }

    context 'with valid attributes' do
      before { patch :update, params: { id: train, train: { number: 'new number' } } }

      it { expect(assigns(:train)).to eq train }

      it 'updates attributes of train' do
        train.reload
        expect(train.number).to eq 'new number'
      end

      it { expect(response).to redirect_to train }
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: train, train: { number: nil } } }

      it { expect(assigns(:train)).to eq train }

      it 'does not update attributes of train' do
        train.reload
        expect(train.number).to eq 'my number'
      end

      it { expect(response).to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the train' do
      train
      expect do
        delete :destroy, params: { id: train, format: :js }
      end.to change(Train, :count).by(-1)
    end

    it 'renders destroy template' do
      delete :destroy, params: { id: train, format: :js }
      expect(response).to render_template :destroy
    end
  end
end
