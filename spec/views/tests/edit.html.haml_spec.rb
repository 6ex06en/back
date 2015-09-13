require 'rails_helper'

RSpec.describe "edit/index", type: :view do

	let!(:test) {FactoryGirl.create(:test)}
	let(:user) {FactoryGirl.create(:user)}

	subject { page }

	before do 
		sign_in user
		click_link("Все вопросы")
		click_link("#{test.question}") 
	end

	describe "update test" do

		it "should render all_test_path" do
			fill_in "Вопрос", with: "1+5"
			click_button("Редактировать")

			expect(page).to have_content("1+5")
		end

	end

end