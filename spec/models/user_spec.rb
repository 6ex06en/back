require 'rails_helper'

RSpec.describe User, type: :model do

  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:email)}
  it{is_expected.to respond_to(:password)}
  it{is_expected.to respond_to(:auth_token)}
  let(:admin) { FactoryGirl.create(:admin)}

  it "new user should be admin" do
  	expect(admin.admin).to be_truthy
  end
end
