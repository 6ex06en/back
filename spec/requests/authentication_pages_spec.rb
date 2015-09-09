require 'rails_helper'

describe "AuthenticationPages" do
 		subject { page }
 		before { visit root_path }

 describe "signin page" do
		it { is_expected.to have_content 'SignUp'}
 		it { is_expected.to have_title 'Study'}
 end

 describe "with invalid information" do
      before { click_button "Submit" }
      it { is_expected.to have_selector('.alert.alert-danger') } 
    end
    describe "with invalid information bug" do
      before { click_button "Submit" }
      before { visit root_path }
      it {is_expected.not_to have_selector('div.alert.alert-danger')}
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "E-mail",    with: user.email
        fill_in "Password", with: user.password
        click_button "Submit"
      end
      it { is_expected.to have_content(user.name) }
      it { is_expected.to have_selector('.alert.alert-success') } 
      it { should_not have_link('SignUp', href: new_user_path) }
  end
end