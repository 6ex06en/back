require 'rails_helper'

RSpec.describe TestsController, type: :controller do
	  let(:user){ FactoryGirl.create(:user)}
	  let(:test) {FactoryGirl.create(:test)}
	  before do
	    sign_in user, no_capybara:true
	  end

	 describe "POST #create" do
	 	it "return http success" do
	 		post :create, test: {question: test.question, score: test.score, answers: test.answers, typeinput: test.typeinput}
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end

	 describe "DELETE #destroy" do
	 	it "return http success" do
	 		delete :destroy,  {id: test.id }
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end
end
