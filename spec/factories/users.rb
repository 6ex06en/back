FactoryGirl.define do

  factory :test do
    question "25 / 5"
    score 100
    typeinput "textInput"
    right_answer ['A']
    answers [{"A" => "5"}]
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
