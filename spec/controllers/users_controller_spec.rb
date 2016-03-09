require 'rails_helper'

describe UsersController, type: :controller do
  describe "GET index" do
    before do
      2.times { FactoryGirl.create(:user) }
      expect(User.count).to eq(2)
    end

    it 'returns all users' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end
end
