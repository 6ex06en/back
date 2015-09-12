FactoryGirl.define do

  factory :test do
    sequence(:question) {|x| "25 + #{x}"}
    score 100
    typeinput "textInput"
    right_answer ['A']
    sequence(:answers) {|x| [{"A" => 25+x}] }
  end

  factory :user do
    name "Test_user"
    password "qweqweqwe"
    password_confirmation "qweqweqwe"
    email "test_admin@test.ru"
    admin false

    factory :admin do
    	name "Test_admin"
   		email "test_admin@test.ru"
   		password "qweqweqwe"
    	password_confirmation "qweqweqwe"
   		admin true
    end
  end

end
