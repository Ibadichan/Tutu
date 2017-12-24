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

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new route to @route' do
      expect(assigns(:route)).to be_a_new Route
    end

    it 'renders template new' do
      expect(response).to render_template :new
    end
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
    let(:route) { create(:route) }

    before { get :show, params: { id: route } }

    it 'assigns the requested route to @route' do
      expect(assigns(:route)).to eq route
    end

    it 'renders template show' do
      expect(response).to render_template :show
    end
  end
end
