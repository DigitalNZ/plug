require 'rails_helper'

module Plug
  RSpec.describe FeaturesController, type: :controller do
    routes { Plug::Engine.routes }

    # This should return the minimal set of attributes required to create a valid
    # Feature. As you add validations to Feature, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { attributes_for(:feature) }
    let(:invalid_attributes) { attributes_for(:feature, :invalid) }
    let(:feature) { create(:feature) }

    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: feature.to_param }
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: feature.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Feature' do
          expect {
            post :create, params: { feature: valid_attributes }
          }.to change(Feature, :count).by(1)
        end

        it 'redirects to the created feature' do
          post :create, params: { feature: valid_attributes }
          expect(response).to redirect_to(Feature.last)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { feature: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) { attributes_for(:feature, name: 'New feature') }

        it 'updates the requested feature' do
          put :update, params: { id: feature.to_param, feature: new_attributes }
          feature.reload
          expect(feature.name).to eq new_attributes[:name]
        end

        it 'redirects to the feature' do
          put :update, params: { id: feature.to_param, feature: valid_attributes }
          expect(response).to redirect_to(feature)
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: feature.to_param, feature: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested feature' do
        feature = create(:feature)

        expect {
          delete :destroy, params: { id: feature.to_param }
        }.to change(Feature, :count).by(-1)
      end

      it 'redirects to the features list' do
        delete :destroy, params: { id: feature.to_param }
        expect(response).to redirect_to(features_path)
      end
    end

  end
end
