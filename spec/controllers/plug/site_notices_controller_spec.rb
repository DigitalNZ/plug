require "rails_helper"

module Plug
  RSpec.describe SiteNoticesController, type: :controller do
    routes { Plug::Engine.routes }

    # This should return the minimal set of attributes required to create a valid
    # site_notice. As you add validations to Site Notice, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) { attributes_for(:site_notice) }
    let(:invalid_attributes) { attributes_for(:site_notice, :invalid) }
    let(:site_notice) { create(:site_notice) }

    describe "GET #index" do
      it "returns a success response" do
        get :index, params: {}
        expect(response).to be_success
      end
    end

    # We don't want this for now
    # describe 'GET #show' do
    #   it 'returns a success response' do
    #     get :show, params: { id: site_notice.to_param }
    #     expect(response).to be_success
    #   end
    # end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}
        expect(response).to be_success
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        get :edit, params: {id: site_notice.to_param}
        expect(response).to be_success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Site Notice" do
          expect {
            post :create, params: {site_notice: valid_attributes}
          }.to change(SiteNotice, :count).by(1)
        end

        it "redirects to the created site notice" do
          post :create, params: {site_notice: valid_attributes}
          expect(response).to redirect_to(site_notices_path)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {site_notice: invalid_attributes}
          expect(response).to be_success
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) { attributes_for(:site_notice, name: "New site notice") }

        it "updates the requested site notice" do
          put :update, params: {id: site_notice.to_param, site_notice: new_attributes}
          site_notice.reload
          expect(site_notice.name).to eq new_attributes[:name]
        end

        it "redirects to the site notice" do
          put :update, params: {id: site_notice.to_param, site_notice: valid_attributes}
          expect(response).to redirect_to(site_notices_path)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: {id: site_notice.to_param, site_notice: invalid_attributes}
          expect(response).to be_success
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested site notice" do
        site_notice = create(:site_notice)

        expect {
          delete :destroy, params: {id: site_notice.to_param}
        }.to change(SiteNotice, :count).by(-1)
      end

      it "redirects to the features list" do
        delete :destroy, params: {id: site_notice.to_param}
        expect(response).to redirect_to(site_notices_path)
      end
    end
  end
end
