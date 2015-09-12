require 'rails_helper'

RSpec.describe "tests/index", type: :view do

	let(:test1) {FactoryGirl.create(:test)}
	let(:test2) {FactoryGirl.create(:test)}
	let(:user) {FactoryGirl.create(:user)}

	subject { page }

	before do 
		sign_in user
		click_link("Все вопросы") 
	end

	describe "page" do
		it "should render all tests" do
			expect(page).to have_css("h3", text: "Все задачи")
			expect(page).to have_content(test1.question)
			expect(page).to have_content(test2.question)
		end
	end

end