require 'rails_helper'

RSpec.describe "tests/index", type: :view do

	let!(:test1) {FactoryGirl.create(:test)}
	let!(:test2) {FactoryGirl.create(:test)}
	let(:user) {FactoryGirl.create(:user)}

	subject { page }

	before do 
		sign_in user
		click_link("Все вопросы") 
	end

	describe "page" do

		it "should render all tests" do
			expect(page).to have_content(test1.question)
			expect(page).to have_content(test2.question)
		end

		describe "should have working links" do

			it "to root_path" do
				click_link("На главную")
				expect(page).to have_content("Создать вопрос для теста")
			end

			it "edit_test" do
				click_link("#{test1.question}")
				expect(page).to have_content("Отредактировать вопрос теста")
				expect(page).to have_content("#{test1.typeinput}")
				expect(page).to have_selector("input[value='#{test1.question}']")
				expect(page).to have_selector("input[value='#{test1.score}']")
				expect(page).to have_selector("input[value='#{test1.answers[0]}']")
			end

		end
	end

end