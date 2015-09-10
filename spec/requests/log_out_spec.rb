require "rails_helper"

describe "start page" do
	let(:user) {FactoryGirl.create(:user)}
	before do
		visit root_path
		fill_in "E-mail", with: user.email
		fill_in "Password", with: user.password
		click_button "Submit"
	end
	subject { page }

	describe "logout" do
		before do
			find(".dropdown-toggle").click
			click_link("Log out", href: session_path(user))
		end

		it{is_expected.to have_content("SignUp")}
	end
end