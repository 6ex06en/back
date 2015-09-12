require 'rails_helper'

RSpec.describe Test, type: :model do

	it{is_expected.to respond_to(:question)}
	it{is_expected.to respond_to(:score)}
	it{is_expected.to respond_to(:checksum)}
	it{is_expected.to respond_to(:answers)}
	it{is_expected.to respond_to(:typeinput)}
	it{is_expected.to respond_to(:right_answer)}
	
	it "before_create #create_checksum" do
		test = Test.create(question: "1+1", score: 1, typeinput: "textInput", answers: [{"A" => 2}], right_answer: ['A'])
		expect(test).to be_valid
		expect(test.checksum).to be_between(1000000, 2000000)
	end
end
