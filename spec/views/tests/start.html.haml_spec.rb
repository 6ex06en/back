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
			fill_in "A", with: "1"
			all(".add_question_container").last.click
			fill_in "B", with: "2"
			all(".add_question_container").last.click
			fill_in "C", with: "4"
			all(".glyphicon.glyphicon-ok").last.click
			click_button "Создать вопрос"
		end

		it "return root_page" do
			expect(page).to have_content(user.name)
			expect(page).to have_link("Все вопросы")
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

	describe "link" do
		it "all tests "do
			click_link "Все вопросы"
			expect(page).to have_content("Все вопросы")
		end 
	end

	describe "create_question", js:true do

		before do
			fill_in "Вопрос", with: "1+4"
			fill_in "Баллы", with: 10
			select "radioButton", from: "type_input"
			fill_in "A", with: "1"
			all(".glyphicon.glyphicon-ok").last.click
			all(".add_question_container").last.click
			fill_in "B", with: "2"
			all(".add_question_container").last.click
			fill_in "C", with: "4"
			all(".glyphicon.glyphicon-ok").last.click
			click_button "Создать вопрос"
		end

		it "not success" do
			expect(page).to have_content("Создать вопрос для теста")
			expect(page).to have_selector("div.alert.alert-danger")
			expect(page).not_to have_selector("div.alert.alert-success")
		end
	end

end