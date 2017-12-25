require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  sign_in_user

  RSpec.shared_examples 'assigns the requested route to @route' do
    it { expect(assigns(:route)).to eq route }
  end

  RSpec.shared_examples 'redirect to assigned route' do
    it { expect(response).to redirect_to route }
  end

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

    it_behaves_like 'assigns the requested route to @route'

    it 'renders template show' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:route) { create(:route) }
    before { get :edit, params: { id: route } }

    it_behaves_like 'assigns the requested route to @route'

    it 'renders template edit' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:route) { create(:route, title: 'my_title') }

    context 'with valid attributes' do
      before { patch :update, params: { id: route, route: { title: 'new title' } } }

      it_behaves_like 'assigns the requested route to @route'

      it 'updates attributes of route' do
        route.reload
        expect(route.title).to eq 'new title'
      end

      it_behaves_like 'redirect to assigned route'
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: route, route: { title: nil } } }

      it_behaves_like 'assigns the requested route to @route'

      it 'does not update attributes of route' do
        route.reload
        expect(route.title).to eq 'my_title'
      end

      it 'renders template edit' do
        expect(response).to render_template :edit
      end
    end
  end
end
