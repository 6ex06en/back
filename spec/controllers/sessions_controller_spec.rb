require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	  let(:user){ FactoryGirl.create(:user)}
	  before do
	    sign_in user, no_capybara:true
	  end

	 describe "POST #create" do
	 	it "return http success" do
	 		post :create, session: {password: user.password, email:user.email}
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end

	 describe "DELETE #destroy" do
	 	it "return http success" do
	 		delete :destroy,  {id: user.id }
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end
end
