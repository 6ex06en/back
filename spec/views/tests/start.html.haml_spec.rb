require 'rails_helper'

RSpec.describe "tests/start", type: :view do

	let(:user) {FactoryGirl.create(:user)}
	# let(:test) {FactoryGirl.create(:test)}

	subject { page }

	before {sign_in user}

	describe "create_question", js:true do
		before do
			fill_in "Вопрос", with: "1+4"
			fill_in "Баллы", with: 10
			select "radioButton", from: "type_input"
			fill_in "Ответы на вопрос", with: "1,2,3"
			click_button "Создать вопрос"
		end

		it "return root_page" do
			expect(page).to have_content(user.name)
			expect(page).to have_selector("input[type='submit'][value='К списку вопросов']")
		end

		it "should be right flash" do
			expect(page).not_to have_selector("div.alert.alert-danger")
			expect(page).to have_selector("div.alert.alert-success")
			expect(page).to have_content("Вопрос теста создан")
		end

		it "should increase count test" do
			expect(Test.count).to eq 1
			expect(Test.first.score).to eq 10
		end
	end
end