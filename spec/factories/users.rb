FactoryGirl.define do

  factory :test do
    question "1+1"
    score 100
    typeinput "radioButton"
    answers [1,2,3]
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
