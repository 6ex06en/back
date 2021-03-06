require 'rails_helper'

RSpec.describe TestsController, type: :controller do

	  let(:user) {FactoryGirl.create(:user)}
	  let(:test) {FactoryGirl.create(:test)}

	  before {sign_in user, no_capybara:true}

	 describe "POST #create" do
	 	it "return http success" do
	 		post :create, test: {question: test.question, score: test.score, answers: test.answers, typeinput: test.typeinput, right_answer: test.right_answer}
	 		expect(response).to have_http_status(:success)
	 	end
	 end

	 describe "DELETE #destroy" do
	 	it "return http success" do
	 		delete :destroy, {id: test.id }
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end

	 describe "PATCH #update" do
	 	it "return http success" do
	 		patch :update, {id: test.id, test: {checksum: test.checksum, question: test.question, score: 10, answers: test.answers, typeinput: test.typeinput, right_answer: test.right_answer}}
	 		expect(response).to have_http_status(:redirect)
	 	end
	 end
end