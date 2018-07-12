require 'rails_helper'

RSpec.describe GenresController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:genre)
  }

  let!(:genre) { create(:genre) }

  describe "GET #index" do
    it "returns a success response" do
      get :index

      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: genre.to_param}

      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new

      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: genre.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Genre" do
        expect {
          post :create, params: {genre: valid_attributes}
        }.to change(Genre, :count).by(1)
      end

      it "redirects to the created genre" do
        post :create, params: {genre: valid_attributes}
        expect(response).to redirect_to(Genre.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:genre)
      }

      it "updates the requested genre" do
        genre = Genre.create! valid_attributes

        put :update, params: {id: genre.to_param, genre: new_attributes}

        expect(genre.name).not_to eql new_attributes[:name]
        genre.reload
        expect(genre.name).to eql new_attributes[:name]
        expect(genre.description).to eql new_attributes[:description]
      end

      it "redirects to the genre" do
        genre = Genre.create! valid_attributes

        put :update, params: {id: genre.to_param, genre: valid_attributes}

        expect(response).to redirect_to(genre)
      end
    end
  end

  describe '#choose' do
    it 'deletes previous session keys' do
      post :choose, session: { key1: 'a session' }

      expect(session[:key1]).to eq nil
    end

    describe 'sets the right sessions' do
      before do
        @genre = Genre.create! valid_attributes

        post :choose, params: { "#{@genre.name}" => true }
      end

      it { is_expected.to set_session[@genre.id.to_s].to(@genre.id) }
    end
  end
end
