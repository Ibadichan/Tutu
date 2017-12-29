require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  sign_in_user

  let(:route) { create(:route) }

  describe 'GET #index' do
    let(:routes) { create_list(:route, 2) }

    before { get :index }

    it { expect(assigns(:routes)).to match_array routes }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:route)).to be_a_new Route }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new route' do
        expect do
          post :create, params: { route: attributes_for(:route) }
        end.to change(Route, :count).by(1)
      end

      it 'redirects to show template' do
        post :create, params: { route: attributes_for(:route) }
        expect(response).to redirect_to assigns(:route)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new route' do
        expect do
          post :create, params: { route: attributes_for(:invalid_route) }
        end.to_not change(Route, :count)
      end

      it 'renders template new' do
        post :create, params: { route: attributes_for(:invalid_route) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: route } }

    it { expect(assigns(:route)).to eq route }
    it { expect(response).to render_template :show }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: route } }

    it { expect(assigns(:route)).to eq route }
    it { expect(response).to render_template :edit }
  end

  describe 'PATCH #update' do
    let(:route) { create(:route, title: 'my_title') }

    context 'with valid attributes' do
      before { patch :update, params: { id: route, route: { title: 'new title' } } }

      it { expect(assigns(:route)).to eq route }

      it 'updates attributes of route' do
        route.reload
        expect(route.title).to eq 'new title'
      end

      it { expect(response).to redirect_to route }
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: route, route: { title: nil } } }

      it { expect(assigns(:route)).to eq route }

      it 'does not update attributes of route' do
        route.reload
        expect(route.title).to eq 'my_title'
      end

      it { expect(response).to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the route' do
      route
      expect do
        delete :destroy, params: { id: route, format: :js }
      end.to change(Route, :count).by(-1)
    end

    it 'renders template destroy' do
      delete :destroy, params: { id: route, format: :js }
      expect(response).to render_template :destroy
    end
  end
end
